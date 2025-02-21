import { useFrame, useLoader } from "@react-three/fiber";
import { useRef } from "react";
import { STLLoader } from "three/examples/jsm/Addons.js";

const pos_offset = [-10, 0, 15];
const rot_offset = [-Math.PI / 2, 0, 0];

function AGV_model() {
    return (
        <>
            <AGV_Body />
            <AGV_Wheel_Left />
            <AGV_Wheel_Right />
        </>
    );
}

function AGV_Body() {
    const stl = useLoader(STLLoader, "/AGV_Body.stl");

    return (
        <mesh position={pos_offset} rotation={rot_offset}>
            <meshStandardMaterial color={0x2980b9} />
            <primitive attach="geometry" object={stl} />
        </mesh>
    );
}

function AGV_Wheel_Left() {
    const stl = useLoader(STLLoader, "/AGV_Wheel_Left.stl");
    const WheelRef = useRef();

    useFrame(() => {
        //WheelRef.current.rotation.z += 0.05;
    });

    return (
        <mesh ref={WheelRef} position={pos_offset} rotation={rot_offset}>
            <meshStandardMaterial color={0xe74c3c} />
            <primitive attach="geometry" object={stl} />
        </mesh>
    );
}

function AGV_Wheel_Right() {
    const stl = useLoader(STLLoader, "/AGV_Wheel_Right.stl");
    const WheelRef = useRef();

    useFrame(() => {
        //WheelRef.current.rotation.z += 0.05;
    });

    return (
        <mesh ref={WheelRef} position={pos_offset} rotation={rot_offset}>
            <meshStandardMaterial color={0xe74c3c} />
            <primitive attach="geometry" object={stl} />
        </mesh>
    );
}

export default AGV_model;
