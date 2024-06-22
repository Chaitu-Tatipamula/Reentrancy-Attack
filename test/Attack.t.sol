// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {Good} from '../src/Good.sol';
import {Attack} from '../src/Attack.sol';
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

contract AttackTest is Test {
    Attack public attackContract;
    Good public goodContract;
    address attacker = vm.addr(1);
    address user = vm.addr(2);
    function setUp() public {
        goodContract = new Good();
        attackContract = new Attack(address(goodContract));

        deal(user, 10 ether);
        deal(attacker, 10 ether);
    }

    function testAttack() public {
        vm.prank(user);

        goodContract.addEth{value : 10 ether}();
        console.logUint(goodContract.balances(user));
        vm.prank(attacker);
        attackContract.attack{value : 1 ether}();
        console.logUint(goodContract.balances(user));
        console.logUint(address(goodContract).balance);

    }
}