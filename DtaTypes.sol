pragma solidity ^0.6.0;

contract MyContract {
    // State variables
    string public myString = "Hello, World!";
    bytes32 public myBytes32 = "Hello, World!";
    uint public myUint = 1;
    uint8 myUint8 = 255;
    uint16 myUint16 = 255;
    uint32 myUint32 = 255;
    uint64 myUint64 = 255;
    uint128 myUint128 = 255;
    uint256 myUint256 = 255;
    address public myAddress = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    struct MyStruct {
        uint myUint;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, World!");

    // Local variables
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }
}
