#customer_details.py
import streamlit as st

def customer_details(conn, insert_customer):
    st.title("Please Enter Your Details")
    customer_name = st.text_input("Name")
    contact_number = st.text_input("Number")
    email = st.text_input("Email")
    address = st.text_input("Address")

    if st.button("Submit"):
        #if not customer_name or not contact_number or not email:
        #    st.error("Please fill in all fields.")
        #else:
            insert_customer(conn, customer_name, contact_number, email, address)
            st.session_state['page'] = 'choose_restaurant'
            st.rerun()