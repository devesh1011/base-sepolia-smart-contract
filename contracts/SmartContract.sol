// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FavNumberStore {
    struct User {
        uint256 id;
        string name;
        uint256 favNumber;
    }

    User[] private users;
    uint256 nextId = 1;

    // func to create a new user
    function createUser(string memory _name, uint256 _favNumber) public {
        users.push(User(nextId, _name, _favNumber));
        nextId++;
    }

    // func to get details of the existing users
    function getUser(uint256 _userId)
        public
        view
        returns (
            uint256,
            string memory,
            uint256
        )
    {
        uint256 index = findUser(_userId);
        return (users[index].id, users[index].name, users[index].favNumber);
    }

    // func to update details of the existing users
    function updateUser(
        uint256 _id,
        string memory _name,
        uint256 _favNumber
    ) public {
        uint256 index = findUser(_id);
        users[index].name = _name;
        users[index].favNumber = _favNumber;

    }

    // func to delete an existing users
    function deleteUser(uint256 _id)public {
        uint256 index = findUser(_id);
        delete users[index];
    }

    // utility functions
    // func to get total number of users on platform
    function getUserCount() public view returns (uint256) {
        return users.length;
    }

    // func to find a user by id
    function findUser(uint256 _id) internal view returns (uint256) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == _id) {
                return i;
            }
        }
        revert("user not found");
    }
}