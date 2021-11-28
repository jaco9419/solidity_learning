pragma solidity ^0.6.0;

contract HotelRoom {
    // Ethers - pay smart contracts

    // payalble so the owner can receive payments
    address payable public owner;

    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;

    event Occupy(address _occupant, uint _value);

    constructor() public {
        // Since the contructor is called only once the contract is deployed,
        // onwer is the address that deployed the contract.
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Room is occupied.");
        _; // It will execute the function body.
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
    }

    receive() external payable onlyWhileVacant costs(2 ether) {
        owner.transfer(msg.value);
        currentStatus = Statuses.Occupied;
        emit Occupy(msg.sender, msg.value);
    }
}
