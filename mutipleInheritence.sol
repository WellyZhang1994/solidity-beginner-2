// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    // Override A.foo()
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

//error : Linearization of inheritance graph impossible
//The inheritence order is very important when we try to inheritence parent contract
//Since B is inheritence A so the A will need to be init first
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}