// pragma solidity ^0.8.6;

contract MyContract {

    struct Owner {
        string Name;
        int balance;
    }

    Owner[] public own;

    function addOwner(string memory Name, int balance) public {
        Owner memory o = Owner(Name, balance);
        own.push(o);
    }

    function withdraw(int withdraw_money, string memory Name) public {
        for (uint i = 0; i < own.length; i++) {
            Owner storage o = own[i];
            if (keccak256(abi.encodePacked(o.Name)) == keccak256(abi.encodePacked(Name))) {
                o.balance -= withdraw_money;
                return; // no need to return a value
            }
        }
    }

    function deposit(int deposit_money, string memory Name) public {
        for (uint i = 0; i < own.length; i++) {
            Owner storage o = own[i];
            if (keccak256(abi.encodePacked(o.Name)) == keccak256(abi.encodePacked(Name))) {
                o.balance += deposit_money;
                return; // no need to return a value
            }
        }
    }

    function getBalance(string memory Name) public view returns (int) {
        for (uint i = 0; i < own.length; i++) {
            Owner memory o = own[i];
            if (keccak256(abi.encodePacked(o.Name)) == keccak256(abi.encodePacked(Name))) {
                return o.balance;
            }
        }
        return -1; // Use a specific value to indicate "Not found"
    }
}
