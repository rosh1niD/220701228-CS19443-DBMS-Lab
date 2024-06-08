#delete_item_from_cart.py
import MySQLdb
import streamlit as st

def delete_item_from_cart(connection, cart_item_id):
    try:
        cursor = connection.cursor()
        query = "DELETE FROM cart_items WHERE cart_item_id = %s"
        cursor.execute(query, (cart_item_id,))
        connection.commit()
    except MySQLdb.Error as e:
        st.error(f"Error deleting item from cart: {e}")