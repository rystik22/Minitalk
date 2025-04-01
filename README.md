# Minitalk

## Introduction
Minitalk is a project developed in **C** that demonstrates inter-process communication using UNIX signals. The goal of the project is to create a simple client-server communication system where a client sends a message to the server, which then reconstructs and prints the message. This repository contains the source code, necessary configurations, and detailed instructions for using the Minitalk application.

The project is a great exercise in understanding low-level system programming, particularly how signals can be used for process synchronization. It adheres to the **42 School** coding standards and is designed to be efficient and reliable.

## Repository Information
- **Repository Name:** Minitalk  
- **Language:** C (92.1%), Makefile (7.9%)

## 🚀 Features
- Implements client-server communication using **SIGUSR1** and **SIGUSR2** signals.
- Encodes and transmits messages bit by bit.
- Handles signal interruptions gracefully.
- Displays real-time messages sent from the client to the server.
- Works efficiently with variable message lengths.
- Uses `sigaction` in the bonus part to notify the server when the client has received the signal.
- Follows **42 School** project guidelines and coding standards.

## 🚀 Usage
To use Minitalk, follow these steps:

### 🛠 Compilation
Run the following command to compile the project:
```sh
make
```
This will generate two executable files:
- `server`
- `client`

### ▶️ Running the Application
1. Start the server by running:
   ```sh
   ./server
   ```
   This will output a **Process ID (PID)**, which is required for the client to send messages.

2. Run the client, providing the server’s PID and the message to send:
   ```sh
   ./client <server_pid> "Your message here"
   ```
   The server will receive the message, decode it, and print it to the terminal.

### ⚙️ Command-Line Arguments
- `<server_pid>`: The process ID of the running server.
- `"Your message here"`: The message to be sent from the client to the server.

### 🛑 Stopping the Server
To stop the server, simply use:
```sh
CTRL + C
```
or
```
ESC
```
This will terminate the server process.

## ⚙️ Understanding the Communication Process
1. The **server** waits for incoming signals from the client.
2. The **client** encodes the message into binary and sends it **bit by bit** using **SIGUSR1 (bit 0)** and **SIGUSR2 (bit 1)**.
3. The **server** reconstructs the binary data into characters and prints the final message.

### 📡 How Signals Work in Minitalk
- `SIGUSR1` represents **bit 0** and `SIGUSR2` represents **bit 1**.
- The **client** sends signals in a loop to transmit each bit of the message.
- The **server** catches the signals and reconstructs the character.
- The **bonus part** uses `sigaction` to allow the client to acknowledge the server that it has received a signal before continuing.

### 🔄 Signal Flowchart
```
Client Process                      Server Process
     |                                    |
     |----(SIGUSR1/SIGUSR2)----->         |
     |                                    |---> Decodes signal to character
     |                                    |---> Prints character
     |                                    |
     |----(Acknowledgment if bonus)-----> |
     |                                    |
```

## 🛠 Error Handling
Minitalk includes basic error handling to ensure smooth execution:
- Invalid input handling (missing or incorrect arguments).
- Error messages for incorrect **PID** or missing executables.
- Graceful shutdown when unexpected signals interrupt the process.

---
