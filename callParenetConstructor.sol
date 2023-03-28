// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Base contract A
contract A {
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract B
contract B {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Pass the parameters here in the inheritance list
contract C is A("Init A"), B("Init B") {
    function returnA() external view returns(string memory){
        //The A.name is "Init A"
        return A.name;
    }
}

// The execution order is defined by the contract declarition. "A, B"
// A -> B
contract D is A,B {
    // Pass the parameters here in the constructor.
    constructor(string memory _name, string memory _text) A(_name) B(_text) {}
}