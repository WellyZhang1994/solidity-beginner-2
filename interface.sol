// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//source contract
contract Counter {
    uint public count;
    function increment() external {
        count += 1;
    }
}

//interface
interface ICounter {

    //only defined the function input, visibility & output
    //state variable count need to be defined as count()
    function count() external view returns (uint);
    function increment() external;
}

contract MyContract {
    //the address is contract address
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}