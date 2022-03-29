import socket

HOST = '0.0.0.0' 
PORT = 7778  

# Create socket for server
with socket.socket(socket.AF_INET, socket.SOCK_DGRAM, 0) as s:
    # Let's send data through UDP protocol
    while True:
        send_data = input("Type some text to send =>")
        s.sendto(send_data.encode('utf-8'), (HOST, PORT))
        print("\n\n 1. Client Sent : ", send_data, "\n\n")
