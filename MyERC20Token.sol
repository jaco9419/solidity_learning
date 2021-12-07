pragma solidity ^0.8.10;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract MyERC20Token is ERC20 {
    address admin;

    constructor() ERC20('My Token', 'MTN') {
        _mint(msg.sender, 10000 * 10 ** 18);
        admin = msg.sender;
    }

    function mint(address to, uint amount) external {
        require(admin == msg.sender, 'only admin');
        _mint(to, amount);
    }

    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }
}
