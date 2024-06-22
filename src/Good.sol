// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

contract Good{
    
    mapping(address => uint256) public balances;
    function addEth() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(balances[msg.sender]>0,"Must have some eth to withdraw");
        (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "Failed");
        balances[msg.sender] = 0;

    }

}