pragma solidity ^0.4.17;

contract Lottery {
    // string public message;

    // function Inbox(string initialMessage) public {
    //     message = initialMessage;
    // }
    // function setMessage(string newMessage) public{
    //     message = newMessage;
    // }
    // function getMessage() public view returns (string){
    //     return message;
    // }
    address public manager;
    address[] public players;
    // address temp = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;


    function Lottery() public{
        manager = msg.sender;
    }

    function enter() public payable{
        require(msg.value> .01 ether);
        players.push(msg.sender);   
    }
    function getlist() public view returns(address[]){
        return players;
    }
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty , now , players));
    }

    function pickWinner() public restricted{
        // require(msg.senger == manager);
        uint index = random() % players.length;
        players[index].transfer(this.balance);
        
        players = new address[](0);

        // temp.transfer(this.balance);
    }

    modifier restricted (){
        require(msg.sender == manager);
        _;

    }
    function getPlayers() public view returns(address[]){
            return players;

    }

}
