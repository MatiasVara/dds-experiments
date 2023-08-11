import socket
import threading
import time

s = socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
s.connect((socket.VMADDR_CID_HOST, 1234))

try:
    while True:
        data = s.recv(1024)
        print ("I heard ", data)
except KeyboardInterrupt:
    print("caugth int")
finally:
    s.close()
