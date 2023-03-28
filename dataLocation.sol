// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _storageFunction(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _storageFunction(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        uint tempId = 10;
        _arr.push(tempId);
        _map[tempId] = msg.sender;
        _myStruct.foo = tempId;
    }

    function memoryFunction(string memory tempString) public pure returns (uint) {
        //try interactive with memory data
        bytes32 stringT = keccak256(abi.encode(tempString));
        uint testData = 10;
        return testData;
    }

    function h(DataLocations.MyStruct calldata structValue) external pure returns(uint){
        //test calldata by pass struct
        return structValue.foo;
    }
}