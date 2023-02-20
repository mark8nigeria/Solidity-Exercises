// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/Receive.sol";

contract DonationsTest is Test {
    Receive public _receive;

    function setUp() public {
        _receive = new Receive();
    }

    function testDonate() external {
        vm.deal(address(this), 1 ether);
        (bool success, ) = address(_receive).call{value: 1 ether}("");
        require(success, "Send ether failed");
        assertEq(address(_receive).balance, 1 ether);
    }
}
