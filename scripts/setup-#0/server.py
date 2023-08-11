# Server running in the host
import socket
import threading
import time

sensor_value = 0

def thread_sensor(name):
    global sensor_value
    while True:
        sensor_value += 1;
        print("Publishing: ", str(sensor_value))
        time.sleep(1)

def thread_client(socket):
    try:
        while True:
            socket.send(str(sensor_value).encode('utf-8'));
            time.sleep(2);
    except KeyboardInterrupt:
        print("caught keyboard interrupt, exiting")
    finally:
        socket.close()

th_sensor = threading.Thread(target=thread_sensor, args=(1,))
th_sensor.start()

s = socket.socket(socket.AF_VSOCK, socket.SOCK_STREAM)
s.bind((socket.VMADDR_CID_ANY, 1234))
s.listen();

try:
    while True:
        client, addr = s.accept()
        th_client = threading.Thread(target=thread_client, args=(client,))
        th_client.start()
except KeyboardInterrupt:
    print("caught keyboard interrupt, exiting")
finally:
    s.close()
