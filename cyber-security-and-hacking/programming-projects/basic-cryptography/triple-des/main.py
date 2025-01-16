import base64

from Crypto.Cipher import DES3
from icecream import ic

"""
generate random encrytion key
"""
key = b"Sixteen Byte Key"

"""
create cipher object using key 
"""
cipher = DES3.new(key, DES3.MODE_EAX)

"""
plaintext message to encrypt
"""
plaintext = b"this is a secret message"

"""
encrypt plaintext message 
"""
ciphertext, tag = cipher.encrypt_and_digest(plaintext)

"""
convert ciphertext and tag to base64 for easy storage 
"""
ciphertext_base64 = base64.b64encode(ciphertext).decode("utf-8")
tag_base64 = base64.b64encode(tag).decode("utf-8")

ic(ciphertext_base64)

"""
decrypt ciphertext 
"""
ciphertext = base64.b64decode(ciphertext_base64)
tag = base64.b64decode(tag_base64)

cipher = DES3.new(key, DES3.MODE_EAX, nonce=cipher.nonce)
plaintext = cipher.decrypt_and_verify(ciphertext, tag)

ic(f"plaintext: {plaintext.decode('utf-8')}")
