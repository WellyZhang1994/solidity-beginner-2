// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Error {
    function testRequire(uint _i) public pure {
        // Require should be used to validate conditions
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        // assert always to check the condition is true
        assert(num == 1);
    }

    // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            //will return custom error ->
            //{InsufficientBalance {balance value : xx ...} }
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}