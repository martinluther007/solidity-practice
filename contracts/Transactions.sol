// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// creating a function that is stored on the ethereum blockchain
contract Transactions {
    // state  like a slot stored in a db
    uint256 transactionCount;
    // events emitted when a transfer occurs
    // the args passed are used to create transaction logs
    // these logs are stored on the blockchain
    event Transfer(
        address sender,
        address receiver,
        uint256 amount,
        string message,
        uint256 timestamo,
        string keyword
    );
    //  like an interface
    struct TransferStruct {
        address sender;
        address receiver;
        uint256 amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    // an address type which is a payable receiver(compulsoery)
    // memory = specific data stored in the address, an additional data
    function addToBlockChain(
        address payable receiver,
        uint256 amount,
        string memory message,
        string memory keyword
    ) public {
        transactionCount += 1;
        transactions.push(
            TransferStruct(
                msg.sender,
                receiver,
                amount,
                message,
                block.timestamp,
                keyword
            )
        );
        emit Transfer(
            (msg.sender),
            receiver,
            amount,
            message,
            block.timestamp,
            keyword
        );
    }

    //A public function wuth view meaning it doesn't alter the state value
    // returns an TransferStruct from memory
    function getAllTransactions()
        public
        view
        returns (TransferStruct[] memory)
    {}

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }
}
