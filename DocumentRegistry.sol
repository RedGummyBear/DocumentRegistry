pragma solidity ^0.5.0;

contract DocumentRegistry {
    struct Document {
        uint timestamp;
        bytes32 hash;
    }

    mapping(bytes32 => Document) public documents;

    function addDocument(bytes32 hash) public {
        require(documents[hash].timestamp == 0, "Document already exists");
        documents[hash] = Document(block.timestamp, hash);
    }

    function verifyDocument(bytes32 hash) public view returns (bool) {
        return documents[hash].timestamp != 0;
    }
}
