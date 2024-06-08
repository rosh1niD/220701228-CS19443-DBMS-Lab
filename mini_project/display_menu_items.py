#display_menu_items.py

import MySQLdb
import streamlit as st
from update_cart import update_cart
from delete_item_from_cart import delete_item_from_cart

def insert_cart(connection, cart_id, item_id, quantity, initial_price):
    try:
        cursor = connection.cursor()
        total_price = initial_price * quantity
        query = "INSERT INTO cart_items (cart_id, item_id, quantity, total_price) VALUES (%s, %s, %s, %s)"
        cursor.execute(query, (cart_id, item_id, quantity, total_price))
        connection.commit()
        st.success("Cart inserted successfully")
    except MySQLdb.Error as e:
        st.error(f"Error inserting cart: {e}")

def display_menu_items(connection, selected_restaurant, cart_id):
    col1, col2, col3 = st.columns([8, 20, 10])
    with col1:
        if st.button("Back"):
            st.session_state['page'] = 'choose_restaurant'
            st.rerun()
    with col3:
        if st.button("Cart"):
            st.session_state['page'] = 'display_cart_details'
            st.rerun()
    
    try:
        cursor = connection.cursor()

        query = "SELECT restaurant_id FROM restaurants WHERE restaurant_name = %s"
        cursor.execute(query, (selected_restaurant,))
        result = cursor.fetchone()

        if result:
            restaurant_id = result[0]

            cursor.execute("SELECT item_id, item_name, price, description, is_veg FROM menu_items WHERE restaurant_id = %s", (restaurant_id,))
            menu_items = cursor.fetchall()

            if 'cart' not in st.session_state:
                st.session_state['cart'] = []

            st.title(f"Menu Items for {selected_restaurant}")
            if menu_items:
                for item in menu_items:
                    item_id, item_name, item_price, item_des, item_veg = item
                    container = st.container(height=250)
                    with container:
                        col1, col2, col3 = st.columns([30, 14, 12])
                        with col1:
                            st.subheader(f"{item_name}", divider='rainbow')
                        with col3:
                            st.subheader(f"Rs.{item_price}", divider='rainbow')
                        st.write(f'{item_des}')
                        if item_veg == 1:
                            st.caption(':green_heart:')
                        else:
                            st.caption(":heart:")
                        quantity = st.number_input(f"Quantity for {item_name}:", min_value=0, step=1, key=item_name)

                        if quantity > 0:
                            item_in_cart = next((i for i in st.session_state['cart'] if i['item_id'] == item_id), None)
                            if item_in_cart:
                                if item_in_cart['quantity'] != quantity:
                                    item_in_cart['quantity'] = quantity
                                    update_cart(connection, cart_id, item_id, quantity)
                            else:
                                st.session_state['cart'].append({
                                    'item_id': item_id,
                                    'item_name': item_name,
                                    'price': item_price,
                                    'quantity': quantity
                                })
                                insert_cart(connection, cart_id, item_id, quantity, item_price)

                        elif quantity == 0:
                            cursor.execute("SELECT cart_item_id FROM cart_items WHERE cart_id = %s AND item_id = %s", (cart_id, item_id))
                            result = cursor.fetchone()

                            if result:
                                cart_item_id = result[0]
                                delete_item_from_cart(connection, cart_item_id)
                                st.session_state['cart'] = [i for i in st.session_state['cart'] if i['item_id'] != item_id]

            else:
                st.write("No menu items found for this restaurant.")
        else:
            st.write("Restaurant not found.")
    
    except MySQLdb.Error as e:
        st.error(f"Error retrieving menu items: {e}")