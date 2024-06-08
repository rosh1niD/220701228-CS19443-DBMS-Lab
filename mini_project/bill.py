#bill.py
import MySQLdb
import streamlit as st
import pandas as pd
from delete_from_bill import delete_from_bill

def display_bill(connection, cart_id):
    try:
        cursor = connection.cursor()
        st.title("Bill Details")
        name_lt = []
        qty_lt = []
        price_lt = []
        query = "SELECT item_id, quantity, total_price FROM cart_items WHERE cart_id = %s"
        cursor.execute(query, (cart_id,))
        cart_items = cursor.fetchall()
        for item in cart_items:
            query = "SELECT item_name FROM menu_items WHERE item_id = %s"
            cursor.execute(query, (item[0],))
            name = cursor.fetchone()
            if name:
                    item_name, = name
            name_lt.append(item_name)
            qty_lt.append(item[1])
            price_lt.append(item[2])
        table = {
            "Item Name":name_lt,
            "Quantity":qty_lt,
            "Total Price":price_lt
        }
        df = pd.DataFrame(table)
        st.dataframe(df,hide_index=True)

        query = """
                SELECT bill_id, cart_id, final_amount, cgst, sgst, service_charge, total_quantity 
                FROM bill 
                WHERE cart_id = %s
                """
        cursor.execute(query, (cart_id,))
        bills = cursor.fetchall()

        if bills:
            for bill in bills:
                container = st.container(height=490)
                with container:
                    col1, col2, col3 = st.columns([30, 20, 12])
                    with col1:
                        st.subheader(f"Bill ID: {bill[0]}")
                    with col3:    
                        st.subheader(f"Cart ID: {bill[1]}")
                    st.divider()
                    st.subheader(f"Total Quantity: {bill[6]}")
                    st.subheader(f"Final Amount: {bill[2]}")
                    
                    with st.expander("Show Extras"):
                        st.subheader(f"CGST: {bill[3]}")
                        st.subheader(f"SGST: {bill[4]}")
                        st.subheader(f"Service Charge: {bill[5]}")

        else:
            st.write("No bills found.")

        if st.button("Back"):
            delete_from_bill(connection, cart_id)
            st.session_state['page'] = 'display_cart_details'
            st.rerun()

    except MySQLdb.Error as e:
        st.error(f"Error retrieving bill details: {e}")