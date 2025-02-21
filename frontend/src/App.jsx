import { useEffect, useState } from "react";
import { socket } from "./socket";
import { Canvas } from "@react-three/fiber";
import { GizmoHelper, GizmoViewcube, OrbitControls } from "@react-three/drei";
import "./App.css";
import AGV_model from "./AGV_model";

function App() {
    const [isConnected, setIsConnected] = useState(socket.connected);
    const [isOnControl, setIsOnControl] = useState(false);
    const [currentKeyInput, setCurrentKeyInput] = useState("");
    const [cameraImg, setCameraImg] = useState();

    useEffect(() => {
        window.addEventListener("keydown", handleKeyboardInput);

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
            window.removeEventListener("keydown", handleKeyboardInput);

            socket.off("connect", onConnect);
            socket.off("disconnect", onDisconnect);
            socket.off("cam", onReceiveCamImage);
        };
    }, []);

    const onControl = () => {
        setIsOnControl((c) => !c);
    };

    const handleKeyboardInput = (e) => {
        setCurrentKeyInput(e.key);
    };

    return (
        <>
            <div id="grid">
                <div className="grid-panel-high">
                    <div>3D</div>
                    <Canvas camera={{ position: [100, 100, 100] }}>
                        <GizmoHelper alignment="bottom-right" margin={[80, 80]}>
                            <GizmoViewcube />
                        </GizmoHelper>
                        <gridHelper args={[200]} />
                        <axesHelper args={[100]} />
                        <OrbitControls />
                        <AGV_model />
                        <ambientLight />
                        <directionalLight position={[2, 5, 1]} />
                    </Canvas>
                </div>
                <div className="grid-panel-high">
                    <div>Camera</div>
                    <img src={cameraImg} className="img" />
                </div>
                <div className="grid-panel-low">
                    <div>Control</div>
                    <div id="controlBox" onClick={onControl}>
                        <div>{isOnControl ? "control" : "no"}</div>
                        <div>{currentKeyInput}</div>
                    </div>
                </div>
                <div className="grid-panel-low">
                    <div>RADAR</div>
                </div>
            </div>
            {isConnected ? "Using WebSocket" : "Connecting To Server"}
        </>
    );
}

export default App;
