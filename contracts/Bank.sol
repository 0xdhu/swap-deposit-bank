// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

// import BUSD Token
// imported 
import './BUSDToken.sol';

contract Bank {
    // assign BUSD Token contract to variable
    BUSDToken private bUSDToken;

    // add mappings
    mapping(address => uint) stakeBalanceOf; // how much player has staked
    mapping(address => uint) stakeStart; // when player has stake
    mapping(address => bool) isDeposited; // check if player has staked or withdrawal

    // add events
    event Stake(address indexed user, uint amount, uint timestart)

    // add constants
    uint private MIN_AMOUNT = 10 ** decimals;   

    // add events
    

    // pass as constructor argument deployed token contract
    constructor(BUSDToken _token) {
        // assign token deployed contract to variable
        bUSDToken = _token;
    }

    // stake on the contract
    function stakeBUSD() payable public {
        address sender = msg.sender;
        //check if msg.sender didn't already deposited funds
        require(!isDeposited(sender), "Error, already staked");
        //check if msg.value is >= than 0.01 ETH
        require(msg.value >= MIN_AMOUNT, "Error, stake amount should be greater/equal to 1 BUSD");
        //increase msg.sender ether deposit balance
        stakeBalanceOf[sender] = stakeBalanceOf[sender] + msg.value;
        //start msg.sender hodling time
        stakeStart[sender] = stakeStart[sender] + block.timestamp;
        //set msg.sender deposit status to true
        isDeposited[sender] = true;
        //emit Deposit event
        emit Stake(sender, msg.value, block.timestamp);
    }

    // customer harvest their rewards
    function harvestBUSD() payable public {
        address payable sender = msg.sender;
        // check if msg.sender deposit status is true

        // calculate the reward
        
        // update stakeStart timestamp
    }

}


    