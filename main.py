from gpiozero import Button
from pythonosc.udp_client import SimpleUDPClient
from signal import pause

# GPIO Pin Setup (Using gpiozero)
BUTTON_PIN = 17  # GPIO17 (Physical pin 11)
button = Button(BUTTON_PIN, pull_up=True, bounce_time=0.005)  # 5ms debounce

# OSC Client Setup (Send to SuperCollider)
SC_IP = "127.0.0.1"  # Change if SuperCollider is running elsewhere
SC_PORT = 57120      # Default SuperCollider OSC port
osc_client = SimpleUDPClient(SC_IP, SC_PORT)

# Function to Send OSC Message on Button Press
def send_osc():
    print("Button Pressed! Sending OSC Message...")
    osc_client.send_message("/playSound", 1)  # Send trigger to SuperCollider

# Attach Event Listener
button.when_pressed = send_osc  # Triggers OSC when button is pressed

# Keep Script Running
pause()  # Blocks execution, keeps listening for button presses