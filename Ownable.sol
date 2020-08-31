pragma solidity >= 0.4.1 <= 0.6.9;

contract Ownable {
  address public owner = msg.sender;

  modifier onlyOwner {
    if (msg.sender != owner) revert("Sender is not owner");
    _;
  }

  function changeOwner(address _newOwner)public
  onlyOwner
  {
    if(_newOwner == 0x0000000000000000000000000000000000000000) revert("new owner address is empty");
    owner = _newOwner;
  }
}