##### `files/functions.py`
##### Car Pool
##### Open-Source, hosted on https://github.com/DrBenjamin/Car_Pool
##### Please reach out to ben@benbox.org for any questions
#### Loading needed Python libraries
import streamlit as st
import streamlit.components.v1 as components
import platform
import subprocess
import webbrowser


## All functions used exclusively in Car Fleet Management
# Function: check_password = Password / user checking
def check_password():
    # Session states
    if ("username" not in st.session_state):
        st.session_state["username"] = ''
    if ("password" not in st.session_state):
        st.session_state["password"] = ''
    if ("password_correct" not in st.session_state):
        st.session_state["password_correct"] = False
    if ('logout' not in st.session_state):
        st.session_state['logout'] = False
    
    # Checks whether a password entered by the user is correct
    def password_entered():
        try:
            if st.session_state["username"] in st.secrets["passwords"] and st.session_state["password"] == st.secrets["passwords"][
                st.session_state["username"]]:
                st.session_state["password_correct"] = True
                
                # Delete username + password
                del st.session_state["password"]
                del st.session_state["username"]
            
            # No combination fits
            else:
                st.session_state["password_correct"] = False
                
        except Exception as e:
            print('Exception in `password_entered` function. Error: ', e)
            st.session_state["password_correct"] = False
    
    # Sidebar
    st.sidebar.image(st.secrets['custom']['sidebar_image'])
    
    # Header switch
    if st.session_state['header'] == True:
        index = 0
    elif st.session_state['header'] == False:
        index = 1
    else:
        index = 0
    header = st.sidebar.radio(label = 'Switch headers on or off', options = ('on', 'off'), index = index, horizontal = True)
    if header == 'on':
        st.session_state['header'] = True
    elif header == 'off':
        st.session_state['header'] = False
    else:
        st.session_state['header'] = True
    
    # First run, show inputs for username + password
    if "password_correct" not in st.session_state:
        st.sidebar.subheader('Please enter username and password')
        st.sidebar.text_input(label = "Username", on_change = password_entered, key = "username")
        st.sidebar.text_input(label = "Password", type = "password", on_change = password_entered, key = "password")
        return False
    
    # Password not correct, show input + error
    elif not st.session_state["password_correct"]:
        st.sidebar.text_input(label = "Username", on_change = password_entered, key = "username")
        st.sidebar.text_input(label = "Password", type = "password", on_change = password_entered, key = "password")
        if (st.session_state['logout']):
            st.sidebar.success('Logout successful!', icon = "✅")
        else:
            st.sidebar.error(body = "User not known or password incorrect!", icon = "🚨")
        return False
    
    else:
        # Password correct
        st.sidebar.success(body = 'You are logged in.', icon = "✅")
        st.sidebar.button(label = 'Logout', on_click = logout)
        return True

# Funtion: logout = Logout button
def logout():
    # Set `logout` to get logout-message
    st.session_state['logout'] = True
    
    # Set password to `false`
    st.session_state["password_correct"] = False

# Function header = Shows header information
def header(title, data_desc, expanded = True):
    # Keyboard interupt functions
    def read_index_html():
        with open("files/F1.html") as f:
            return f.read()

    def f1_callback():
        try:
            subprocess.Popen('HH files/Car_Pool.chm::Introduction.html', shell = False)
        except Exception as e:
            print('Exception in `f1_callback` function. Error: ', e)
            webbrowser.open_new_tab('https://www.benbox.org/Car_Pool/Introduction.html')

    with st.expander("Header", expanded = expanded):
        # Header information
        st.title(title)
        st.image(st.secrets['custom']['logo_image'])
        st.header(st.secrets['custom']['organisation'])
        st.subheader(st.secrets['custom']['organisation_abbreviation'] + ' ' + data_desc)
        st.write('The ' + title + ' App runs on Python (v' + platform.python_version() + ') and Streamlit (v' + st.__version__ + ').')
        st.write('All data is stored in a local database hosted by ' + st.secrets['custom']['organisation_abbreviation'] + '.')
        txt, but = st.columns(2, gap = "small")
        txt.write('You can directly access the help through pressing')
        but.button("`F1`", on_click = f1_callback)
        components.html(read_index_html(), height = 0, width = 0,)
        st.markdown('or opening a <a href="https://www.benbox.org/Car_Pool/Introduction.html" target="_blank">seperate tab in your browser</a>, if this is not working.', unsafe_allow_html = True)
        
# Function: landing_page = Shows landing page
def landing_page(page):
    # Title and information
    header = 'Welcome to the' + page
    st.title(header)
    st.header(st.secrets['custom']['organisation'] + ' (' + st.secrets['custom']['organisation_abbreviation'] + ')')
    st.subheader('User Login')
    st.info(body = 'Please login (sidebar on the left) to access the ' + page, icon = "ℹ️")
