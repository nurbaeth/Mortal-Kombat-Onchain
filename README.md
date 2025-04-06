# Mortal Kombat Onchain

Mortal Kombat Onchain is a blockchain-based fighting game inspired by the legendary Mortal Kombat franchise. Built entirely on Solidity, it allows players to select fighters, engage in battles, and determine the winner in a trustless, decentralized manner.

## Features
- Fully onchain gameplay
- Select from iconic fighters like Scorpion, Sub-Zero, and Raiden
- Turn-based battle system
- Immutable and transparent fight outcomes
- Smart contract handles all fight mechanics

## How It Works
1. **Select Your Fighter** – Choose a character to represent you in battle.
2. **Start a Battle** – Challenge another player to a fight.
3. **Take Turns Attacking** – Each player attacks on their turn.   
4. **Win or Lose** – The first player to reduce their opponent’s health to 0 wins the battle.

## Deployment & Usage
1. Deploy the `MortalKombatOnchain.sol` smart contract.
2. Players can interact with the contract via Web3 tools like Remix, Hardhat, or a custom front-end.
3. Use the following functions:
   - `selectFighter(uint256 _fighterId)` – Choose a fighter.
   - `startBattle(address _opponent)` – Initiate a battle.
   - `attack(address _opponent)` – Attack the opponent.

## Roadmap
- Add more fighters with unique abilities.
- Implement fatalities and special moves.
- Introduce a ranking system and leaderboards.
- Create a frontend UI for better interaction.

## License
This project is open-source under the MIT License.
