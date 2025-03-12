// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DecentralizedChat {
    struct Message {
        address sender;
        string text;
        uint timestamp;
    }

    Message[] public messages;
    mapping(address => uint) public userMessageCount;

    event NewMessage(address indexed sender, string text, uint timestamp);

    function sendMessage(string memory _text) public {
        require(bytes(_text).length > 0, "Message cannot be empty");
        
        messages.push(Message(msg.sender, _text, block.timestamp));
        userMessageCount[msg.sender]++;

        emit NewMessage(msg.sender, _text, block.timestamp);
    }

    function getMessages() public view returns (Message[] memory) {
        return messages;
    }

    function getUserMessageCount(address _user) public view returns (uint) {
        return userMessageCount[_user];
    }
}
