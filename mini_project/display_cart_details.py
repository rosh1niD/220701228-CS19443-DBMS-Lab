#display_cart_details.py

import streamlit as st
import MySQLdb
from update_cart import update_cart
from delete_item_from_cart import delete_item_from_cart

def insert_bill(conn, cart_id):
    try:
        cursor = conn.cursor()

        select_query = "SELECT cart_id, customer_id, total_price FROM cart_info WHERE cart_id = %s"
        cursor.execute(select_query, (cart_id,))
        result = cursor.fetchone()

        if result:
            cart_id, customer_id, total_price = result

            insert_query = "INSERT INTO bill (cart_id, customer_id, amount) VALUES (%s, %s, %s)"
            cursor.execute(insert_query, (cart_id, customer_id, total_price))
            bill_id = cursor.lastrowid
            cursor.callproc('calculate_gst', (total_price, bill_id))
            cursor.callproc('calculate_service_charge', (total_price, bill_id))
            query = "SELECT amount, cgst, sgst, service_charge from bill where bill_id = %s"
            cursor.execute(query, (bill_id,))
            calc = cursor.fetchone()
            amount, cgst, sgst, service_charge = calc
            cursor.callproc('calculate_final_amount', (amount, cgst, sgst, service_charge, bill_id))
            cursor.callproc('calculate_total_quantity', [cart_id])
            conn.commit()
        else:
            st.error("Cart not found.")

    except MySQLdb.Error as e:
        st.error(f"Error: '{e}'")

def display_cart_details(connection, cart_id):
    try:
        cursor = connection.cursor()
        if cart_id is None:
            st.error("Cart ID not found in session state.")
            return

        query = "SELECT item_id, quantity, total_price FROM cart_items WHERE cart_id = %s"
        cursor.execute(query, (cart_id,))
        cart_items = cursor.fetchall()

        if st.button("Back"):
            st.session_state['page'] = 'display_menu_items'
            st.rerun()

        st.title("Cart Details")
        if cart_items:
            if 'cart_quantities' not in st.session_state:
                st.session_state.cart_quantities = {}
                st.session_state.cart = []

            for item in cart_items:
                item_id, quantity, total_price_per_item = item
                query = "SELECT item_name, price FROM menu_items WHERE item_id = %s"
                cursor.execute(query, (item_id,))
                item_name_result = cursor.fetchone()

                if item_name_result:
                    item_name, item_price = item_name_result
                else:
                    item_name = "Unknown"
                    item_price = 0

                if item_id not in st.session_state.cart_quantities:
                    st.session_state.cart_quantities[item_id] = quantity

                container = st.container(height=280)
                with container:
                    st.subheader(f"{item_name}",divider="rainbow")

                    current_quantity = st.number_input(
                        f"Quantity for {item_name}:",
                        min_value=0,
                        step=1,
                        key=f"quantity_{item_id}",
                        value=st.session_state.cart_quantities[item_id]
                    )
                
                    st.session_state.cart_quantities[item_id] = current_quantity

                    if current_quantity > 0:
                        item_in_cart = next((i for i in st.session_state['cart'] if i['item_id'] == item_id), None)
                        if item_in_cart:
                            if item_in_cart['quantity'] != current_quantity:
                                item_in_cart['quantity'] = current_quantity
                                update_cart(connection, cart_id, item_id, current_quantity)
                        else:
                            st.session_state['cart'].append({
                                'item_id': item_id,
                                'item_name': item_name,
                                'price': item_price,
                                'quantity': current_quantity
                            })

                    elif current_quantity == 0:
                        cursor.execute("SELECT cart_item_id FROM cart_items WHERE cart_id = %s AND item_id = %s",
                                    (cart_id, item_id))
                        result = cursor.fetchone()
                        if result:
                            cart_item_id = result[0]
                            delete_item_from_cart(connection, cart_item_id)
                            st.session_state['cart'] = [i for i in st.session_state['cart'] if i['item_id'] != item_id]

                    cursor.execute("SELECT total_price FROM cart_items WHERE cart_id = %s AND item_id = %s", (cart_id, item_id))
                    total_price_result = cursor.fetchone()

                    if total_price_result:
                        updated_total_price_per_item = total_price_result[0]
                        st.subheader(f"Price: {updated_total_price_per_item}")

                    if st.button(f"Delete", key=f"delete_{item_id}"):
                        cursor.execute("SELECT cart_item_id FROM cart_items WHERE cart_id = %s AND item_id = %s",
                                    (cart_id, item_id))
                        result = cursor.fetchone()
                        if result:
                            cart_item_id = result[0]
                            delete_item_from_cart(connection, cart_item_id)
                            st.session_state['cart'] = [i for i in st.session_state['cart'] if i['item_id'] != item_id]
                            st.experimental_rerun()

            query = "SELECT total_price FROM cart_info WHERE cart_id = %s"
            cursor.execute(query, (cart_id,))
            total_price_result = cursor.fetchone()

            if total_price_result:
                total_price = total_price_result[0]
                st.header(f"Total Price: {total_price}")
        
            if st.button("Place Order"):
                print(1)
                insert_bill(connection,cart_id)
                st.session_state['page'] = 'bill'
                st.rerun()

        else:
            st.write("Your cart is empty.")
    except MySQLdb.Error as e:
        st.error(f"Error retrieving cart details: {e}")