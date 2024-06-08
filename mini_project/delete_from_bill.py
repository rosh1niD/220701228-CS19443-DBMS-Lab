#delete_from_bill.py
import MySQLdb
import streamlit as st

def delete_from_bill(connection, cart_id):
    try:
        cursor = connection.cursor()
        query = "DELETE FROM bill WHERE cart_id = %s"
        cursor.execute(query, (cart_id,))
        connection.commit()
        st.success("Bill deleted successfully.")
    except MySQLdb.Error as e:
        st.error(f"Error deleting bill: {e}")