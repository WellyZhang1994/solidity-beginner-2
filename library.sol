// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//The first method to call min method is use library name to call function.
library Math {
    function Min(uint x, uint y) internal pure returns (uint z) {
        return x > y ? y : x;
    }
}

contract TestMath {
    function testMath(uint x, uint y) public pure returns (uint) {
        return Math.Min(x,y);
    }
}

// Array function to find the element index
library Array {
    function find(uint[] storage arr, uint number) internal view returns (uint) {
        for (uint i = 0; i<= arr.length; i++) {
            if(arr[i] == number){
                return i;
            }
        }
        revert("Not found");
    }
}

contract TestArray {
    //We can declare using keyword to let uint[] has the "find" method
    using Array for uint[];

    uint[] public arr;

    function testArrayRemove() public {
        for (uint i = 0; i < 3; i++) {
            arr.push(i);
        }
        uint findIndex = arr.find(1);
    }
}