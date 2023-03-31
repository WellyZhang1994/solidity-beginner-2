// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

interface IERC20 {

    //Total supply amount of token
    function totalSupply() external view returns (uint);

    //The balance value of each account can be searched by any user in whole ethereum.

    function balanceOf(address account) external view returns (uint);

    //Can transfer amount from msg.sender to recipient
    function transfer(address recipient, uint amount) external returns (bool);

    //To store the value which can be received from the spender.
    //Need to use approve function first.
    function allowance(address owner, address spender) external view returns (uint);

    //Approve someone to transfer some tokens.
    function approve(address spender, uint amount) external returns (bool);

    //Transfer token from A to B.
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    //Create an event when user transfer the token or approve some spending.
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract WES_ERC20 is IERC20 {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    //Token name, symbol & decimals
    //Decimal means the minimum unit of token
    string public name = "WellyToken";
    string public symbol = "WES";
    uint8 public decimals = 18;

    //Transfer
    //Step1. Get the balance from sender's address and minus the amount
    //Step2. Get the balance from recipient and add the amount
    //Step3. Send transfer event for logging 
    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    //Approve
    //Step1. Grant the permission for spender to use owner's token for specific amount.
    //Step2. Send the Approval event.
    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    //TransferFrom
    //1. check the allowance first.
    //2. handle the transaction from sender to receiver
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
