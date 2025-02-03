import { useEffect, useState } from "react";
import { socket } from "./socket";
import "./App.css";

function App() {
  const [isConnected, setIsConnected] = useState(socket.connected);
  const [cameraImg, setCameraImg] = useState();

  useEffect(() => {
    // this is all related to websocket
    function onConnect() {
      setIsConnected(true);
    }

    function onDisconnect() {
      setIsConnected(false);
    }

    function onReceiveCamImage(baseStr64) {
      const url = "data:image/jpg;base64," + baseStr64;
      setCameraImg(url);
    }

    socket.on("connect", onConnect);
    socket.on("disconnect", onDisconnect);
    socket.on("cam", onReceiveCamImage);

    return () => {
      socket.off("connect", onConnect);
      socket.off("disconnect", onDisconnect);
      socket.off("cam", onReceiveCamImage);
    };
  }, []);

  return (
    <>
      <div id="grid">
        <div>3D</div>
        <div>
          <div>Camera</div>
          <img src={cameraImg} className="img" />
        </div>
        <div>
          <div>Control</div>
        </div>
        <div>
          <div>RADAR</div>
        </div>
      </div>
      {isConnected ? "Using WebSocket" : "Connecting To Server"}
    </>
  );
}

export default App;
