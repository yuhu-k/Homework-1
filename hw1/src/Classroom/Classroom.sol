// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    bool private registed = false;

    function register() external returns (uint256) {
        if (!registed) {
            registed = true;
            return 1000;
        } else {
            return 123;
        }
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        bool checker = isEnrolledInClassroom(msg.sender);
        if (!checker){
            return 1000;
        } else {
            return 123;
        }
    }

    function isEnrolledInClassroom(address classroomAddress) public view returns (bool) {
        IClassroomV2 classroom = IClassroomV2(classroomAddress);
        return classroom.isEnrolled();
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        if (gasleft() > 7000){
            return 1000;
        }else{
            return 123;
        }
    }

}
