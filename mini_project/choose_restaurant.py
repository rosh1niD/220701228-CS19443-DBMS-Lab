#choose_restaurant.py
import streamlit as st
import os
import MySQLdb
from streamlit_option_menu import option_menu

def update_cart_info(connection, restaurant_id, cart_id):
    try:
        print("called")
        cursor = connection.cursor()
        print(cart_id)
        query = "UPDATE cart_info SET restaurant_id = %s WHERE cart_id = %s"
        cursor.execute(query, (restaurant_id, cart_id))
        connection.commit()
        st.success("Cart info updated successfully")
    except MySQLdb.Error as e:
        st.error(f"Error: '{e}'")

def choose_restaurant(connection, restaurants, cart_id):
    with st.sidebar:
        selected = option_menu("Restaurants", ["La Trattoria", "Sushi World","Taco Fiesta","Burger Haven","Dosa Delight"], icons=['house','house','house','house','house'], menu_icon="houses", default_index=0)
    st.title(selected)
    image_path = None
    selected_restaurant_id = None  
    for row in restaurants:
        if row[0] == selected:
            selected_restaurant_id = row[2]
            image_path = row[1]
            break

    if image_path and os.path.exists(image_path):
        st.image(image_path, caption=f"Image of {selected}", use_column_width=True)
    else:
        st.error(f"Image not found for {selected}")

    if st.button("View Menu Items"):
        st.session_state['selected_restaurant'] = selected
        st.session_state['selected_restaurant_id'] = selected_restaurant_id
        st.session_state['page'] = 'display_menu_items'
        update_cart_info(connection, selected_restaurant_id, cart_id)        
        st.rerun()