// pragma solidity ^0.8.6;

contract MyContract {

    struct Owner {
        string Name;
        int balance;
    }

    Owner[] public own;

    function addOwner(int balance, string memory Name) public {
        Owner memory o = Owner(Name, balance);
        own.push(o);
    }

    function getBalance(string memory name) public view returns (int) {
        for (uint i = 0; i < own.length; i++) {
            Owner memory o = own[i];
            if (keccak256(abi.encodePacked(o.Name)) == keccak256(abi.encodePacked(name))) {
                return o.balance;
            }
        }
        return -1; // Use a specific value to indicate "Not found"
    }
}
