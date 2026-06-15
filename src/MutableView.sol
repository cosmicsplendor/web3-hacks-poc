// SPDC_LICENSE_IDENTIFIER: MIT
pragma solidity ^0.8.6;
interface ISold {
    function isSold() external view returns (bool);
}
contract MutableView {
    function price() public view returns (uint256) {
        if (ISold(msg.sender).isSold()) return 0;
        return 100;
    }
}
