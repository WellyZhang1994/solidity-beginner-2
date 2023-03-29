// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract A {
    // the virtual keyword means this function can be override
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    // If the function has keyword virtual & override that means this function will override parent's function 
    // and can be override by child contract.
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}