pragma solidity ^0.6.0;

contract Arrays {
    uint[] public uintArray = [1, 2, 3, 4];
    string[] public stringArray = ["apple", "banana", "carrot"];
    string[] public values;
    uint[][] public array2d = [ [1, 2, 3], [4, 5, 6] ];

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valuesCount() public view returns (uint) {
        return values.length;
    }
}
