import socket
from time import sleep
from threading import Thread
import os

HOST = '0.0.0.0' 
PORT = 7778
TTL  = int (os.getenv('SERVER_TTL', "600"))    

def upd_server(): 
    # Create a UDP socket
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  as s:
        # Bind the socket to the port
        s.bind((HOST, PORT))
        while True:
            print("####### Server is listening #######")
            data, address = s.recvfrom(4096)
            print("\n\n 2. Server received: ", data.decode('utf-8'), "\n\n")

# run the some_task function in another thread          
t = Thread(target=upd_server)
   
open("/var/run/server-udp.status", "a").close()

# Python will exit when the main thread exits  
t.daemon = True                               
t.start()
snooziness = int(TTL)
sleep(snooziness)         