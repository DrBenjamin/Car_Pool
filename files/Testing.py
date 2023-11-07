##### `files/Testing.py`
##### Car Pool
##### Open-Source, hosted on https://github.com/SeriousBenEntertainment/Car_Pool
##### Please reach out to ben@benbox.org for any questions
#### Loading needed Python libraries
import streamlit as st
from streamlit.testing.v1 import AppTest
from datetime import date
from datetime import timedelta
from datetime import time

at = AppTest.from_file("Car_Pool.py")
at.run()
assert not at.exception

# Start testing
at.sidebar.text_input("username").input(list(st.secrets["passwords"].keys())[0]).run()
at.sidebar.text_input("password").input(list(st.secrets["passwords"].values())[0]).run()

# Tab `Driving``
at.text_input("name_driving").input("Benjamin Gross").run()
at.selectbox("sex_driving").select("male").run()
at.text_input("phone_driving").input("+265 98 347 6744").run()
at.text_input("mail_driving").input("benjamin.gross@giz.de").run()
at.selectbox("dep_driving").select("Dedza").run()
at.selectbox("des_driving").select("Balaka").run()
at.date_input("date_driving").set_value(date.today()).run()
at.time_input("stime_driving").set_value(time(12, 0)).run()
at.time_input("etime_driving").set_value(time(14, 0)).run()
at.number_input("num_driving").set_value(3).run()
at.selectbox("guest_driving").select("all sexes").run()
at.button[1].click().run() # Write to database

# Tab `Hitchhiking``
at.date_input("rstart").set_value(date.today()).run()
at.date_input("rend").set_value(date.today() + timedelta(days = 60)).run()
at.selectbox("dep_hitchhiking").select("Dedza").run()
at.selectbox("des_hitchhiking").select("Blantyre").run()
at.checkbox("fem_hitchhiking").check().run()
at.checkbox("fem_g_hitchhiking").check().run()

# Tab `Booking`
at.text_input("name_booking").input("Benjamin Gross").run()
at.number_input("num_booking").set_value(1).run()
at.button("book1").click().run() # Write to database

# Open help
at.button[0].click().run()