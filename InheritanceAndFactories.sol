pragma solidity ^0.6.0;

// Inheritance
// Factories
// Smart contracts interactions

contract Ownable {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyCalledByOwner() {
        require(owner == msg.sender, "Only the contract's owner has access.");
        _;
    }

}

contract SecretVault {
    string secret;

    constructor(string memory _secret) public {
        secret = _secret;
    }

    function getSecret() public view returns(string memory) {
        return secret;
    }
}

contract InheritanceAndFactories is Ownable { // is Ownable makes the inheritance
    address secretVault;

    constructor(string memory _secret) public {
        SecretVault _secretVault = new SecretVault(_secret); // Creates a new contract from SecretVault
        secretVault = address(_secretVault); // Gets the address of the newly created contract and assigns it to secretVault
        super;
    }

    function getSecret() public view onlyCalledByOwner returns(string memory) {
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();
    }
}
