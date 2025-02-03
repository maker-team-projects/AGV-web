const express = require("express");
const http = require("http");
const { Server } = require("socket.io");

const shm = require("./addons/build/Release/shm");

// server initialization
const app = express();
const httpServer = http.createServer(app);
const socket = new Server(httpServer, {
  cors: {
    origin: "*",
  },
  maxHttpBufferSize: 1e8,
});

// Shared Memory Initializatiopn
shm.init(0);

// variable
var camImg = "";

// Web Socket
socket.on("connection", async (socket) => {
  setInterval(() => {
    var camImg = shm.read(0);
    socket.emit("cam", camImg); // Send Pipe Data to Client
  }, 10);
});

// Initialize HTTP server
httpServer.listen(3000, () => {
  console.log("Server Connected");
});

//shm.exit(0);
