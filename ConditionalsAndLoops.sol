pragma solidity ^0.6.0;

contract ConditionalsAndLoops {
    // Is owner code
    
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function isOwner() public view returns(bool) {
        return msg.sender == owner;
    }

    // Is even code

    uint[] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function isEven(uint _number) public view returns(bool) {
        return _number % 2 == 0;
    }

    function countEvenNumbers() public view returns(uint) {
        uint counter = 0;

        for(uint i = 0; i < numbers.length; i++) {
           if ( isEven(numbers[i]) ) counter++;
        }

        return counter;
    }
}
