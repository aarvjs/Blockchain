// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Lottery{
    address public manager;
    address payable[] public participants;

    constructor(){
        manager = msg.sender;  //Global variable
    }

    receive() external payable {  // only one time use
    require(msg.value == 1 ether); 
    participants.push(payable(msg.sender));

     } 

     function getBalnce() public view returns ( uint) {   // get the balance of the contract
     require(msg.sender == manager);
     return address(this).balance;
     }

   function random() public view returns (uint) {
    return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, participants.length)));
}


function selectwinner() public returns (address) {
    require(msg.sender == manager, "Only managerselect winner");
    require(participants.length >= 3, "Not more participant");

    uint r = random();
    uint index = r % participants.length;
    address payable winner = participants[index];

    uint prize = getBalnce();
    winner.transfer(prize);
    participants = new address payable[] (0);

    return winner;

}
 
    



}