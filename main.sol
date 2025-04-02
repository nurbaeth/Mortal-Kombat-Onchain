// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MortalKombatOnchain {
    struct Fighter {
        string name;
        uint256 health;
        uint256 attackPower;
    }

    struct Battle {
        address player1;
        address player2;
        uint256 fighter1;
        uint256 fighter2;
        uint256 turn;
        bool active;
    }

    Fighter[] public fighters;
    mapping(address => uint256) public playerFighters;
    mapping(address => Battle) public battles;

    event FighterSelected(address indexed player, uint256 fighterId);
    event Attack(address indexed attacker, address indexed defender, uint256 damage);
    event BattleEnded(address winner, address loser);

    constructor() {
        fighters.push(Fighter("Scorpion", 100, 20));
        fighters.push(Fighter("Sub-Zero", 100, 18));
        fighters.push(Fighter("Raiden", 100, 22));
    }

    function selectFighter(uint256 _fighterId) external {
        require(_fighterId < fighters.length, "Invalid fighter ID");
        playerFighters[msg.sender] = _fighterId;
        emit FighterSelected(msg.sender, _fighterId);
    }

    function startBattle(address _opponent) external {
        require(playerFighters[msg.sender] != 0, "Select a fighter first");
        require(playerFighters[_opponent] != 0, "Opponent has no fighter");
        require(battles[msg.sender].active == false, "Already in battle");
        require(battles[_opponent].active == false, "Opponent in battle");
        
        battles[msg.sender] = Battle(msg.sender, _opponent, playerFighters[msg.sender], playerFighters[_opponent], 0, true);
        battles[_opponent] = battles[msg.sender];
    }

    function attack(address _opponent) external {
        Battle storage battle = battles[msg.sender];
        require(battle.active, "No active battle");
        require(battle.turn % 2 == 0 && battle.player1 == msg.sender || battle.turn % 2 == 1 && battle.player2 == msg.sender, "Not your turn");
        
        uint256 attackerId = playerFighters[msg.sender];
        uint256 defenderId = playerFighters[_opponent];
        uint256 damage = fighters[attackerId].attackPower;
        
        fighters[defenderId].health -= damage;
        emit Attack(msg.sender, _opponent, damage);
        
        if (fighters[defenderId].health <= 0) {
            emit BattleEnded(msg.sender, _opponent);
            battles[msg.sender].active = false;
            battles[_opponent].active = false;
        } else {
            battle.turn++;
        }
    }
}
