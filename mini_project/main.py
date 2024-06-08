#main.py
from connection import conn
import MySQLdb
import streamlit as st
from customer_details import customer_details
from choose_restaurant import choose_restaurant
from display_menu_items import display_menu_items
from display_cart_details import display_cart_details
from bill import display_bill

def insert_customer(connection, customer_name, contact_number, address, email):
    try:
        cursor = connection.cursor()
        query = "INSERT INTO customer (customer_name, contact_number, address, email) VALUES (%s, %s, %s, %s)"
        cursor.execute(query, (customer_name, contact_number, address, email))
        customer_id = cursor.lastrowid
        query_cart = "INSERT INTO cart_info (customer_id, total_price) VALUES (%s, %s)"
        cursor.execute(query_cart, (customer_id, 0))
        cart_id = cursor.lastrowid
        st.session_state['cart_id'] = cart_id
        connection.commit()
        st.success("Customer inserted successfully")
    except MySQLdb.Error as e:
        st.error(f"Error: '{e}'")

def get_restaurants():
    restaurants = []
    try:
        if conn.is_connected():
            cursor = conn.cursor()
            cursor.execute("SELECT restaurant_name, images, restaurant_id FROM restaurants")
            rows = cursor.fetchall()
            restaurants = [(row[0], row[1], row[2]) for row in rows]
    except MySQLdb.Error as e:
        st.error(f"Error retrieving restaurant names: {e}")
    return restaurants

if conn:
    if 'page' not in st.session_state:
        st.session_state['page'] = 'customer_details'

    if st.session_state['page'] == 'customer_details':
        customer_details(conn, insert_customer)
    elif st.session_state['page'] == 'choose_restaurant':
        restaurants = get_restaurants()
        selected_restaurant = choose_restaurant(conn, restaurants,st.session_state['cart_id'])
        if selected_restaurant: 
            print(selected_restaurant)
            st.session_state['selected_restaurant'] = selected_restaurant
            st.session_state['page'] = 'display_menu_items'

    elif st.session_state['page'] == 'display_menu_items':
        display_menu_items(conn, st.session_state['selected_restaurant'],st.session_state['cart_id'])
    elif st.session_state['page'] == 'display_cart_details':  
        display_cart_details(conn,st.session_state['cart_id'])
    elif st.session_state['page'] == 'bill':
        display_bill(conn,st.session_state['cart_id'])