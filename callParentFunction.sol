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
        //use super will auto call parent's foo()
        return super.foo();
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B{
    function foo() public pure override(C,B) returns (string memory) {
        //will return C.foo() => "C"
        return super.foo();
    }
}