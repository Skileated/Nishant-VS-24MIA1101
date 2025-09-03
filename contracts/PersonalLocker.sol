// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0;

contract PersonalLocker {
    address public owner;
    string private secretMessage;
    string private secretPassword;
    string public block_contr;

    event MessageUpdated(string oldMessage, string newMessage);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(string memory initialMessage, string memory password) {
        owner = msg.sender;
        secretMessage = initialMessage;
        secretPassword = password;
        block_contr = "PersonalLocker";
    }

    function updateMessage(string memory newMessage, string memory password) external onlyOwner {
        require(keccak256(abi.encodePacked(password)) == keccak256(abi.encodePacked(secretPassword)), "Wrong password");
        string memory oldMessage = secretMessage;
        secretMessage = newMessage;
        emit MessageUpdated(oldMessage, newMessage);
    }

    function readMessage() external view returns (string memory) {
        return secretMessage;
    }

    function revealPassword() external view onlyOwner returns (string memory) {
        return secretPassword;
    }

    receive() external payable {}
    fallback() external payable {}
}
