// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SolvaneInspector {
    // Static metadata for consistent read-only inspection
    string public constant NAME = "SolvaneInspector";
    string public constant PURPOSE = "Read-only inspection + optional ping for explorer visibility";
    string public constant VERSION = "1.0.0";

    uint256 public pingCount;
    bytes32 public lastPingId;
    address public lastCaller;

    event Ping(address indexed caller, bytes32 indexed pingId, uint256 indexed count, string note);

    /// @notice Deterministic fingerprint for stable eth_call checks.
    function fingerprint() external pure returns (bytes32) {
        return keccak256("SOLVANE:INSPECTOR:FINGERPRINT:V1");
    }

    /// @notice Returns a compact snapshot for logging in tools/scripts.
    function snapshot()
        external
        view
        returns (bytes32 fp, uint256 chainLikeBlock, uint256 timestamp, address caller, uint256 count)
    {
        return (this.fingerprint(), block.number, block.timestamp, lastCaller, pingCount);
    }

    /// @notice Optional write path for validating signing + event indexing on explorers.
    function ping(string calldata note) external {
        bytes32 id = keccak256(abi.encodePacked(note, msg.sender, block.number));
        pingCount += 1;
        lastPingId = id;
        lastCaller = msg.sender;
        emit Ping(msg.sender, id, pingCount, note);
    }
}
