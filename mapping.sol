// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public balances;
    // Mapping of Mapping
    mapping(address => mapping(address => bool)) public isFriend;

    function getBalance(address _addr) public view returns (uint) {
        return balances[_addr];
    }

    function checkIsFriend(address _addr) public view returns (bool) {
        return isFriend[msg.sender][_addr];
    }
}