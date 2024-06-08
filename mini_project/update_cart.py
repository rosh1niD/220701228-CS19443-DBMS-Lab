#update_cart.py
import MySQLdb
import streamlit as st

def update_cart(connection, cart_id, item_id, quantity):
    try:
        cursor = connection.cursor()
        query = "UPDATE cart_items SET quantity = %s WHERE cart_id = %s AND item_id = %s"
        cursor.execute(query, (quantity, cart_id, item_id))
        connection.commit()
    except MySQLdb.Error as e:
        st.error(f"Error updating cart: {e}")