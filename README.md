# forge-smartcontract-raffle

This is going to be me following the lesson 13 tutorial of Patrick Collins 32 Hour FCC course attempting to swap out the Hardhat and Javascript for Foundry

Commands and usage

forge build - to compile the contracts
forge test - to execute tests
anvil - to run a local node

forge script script/Raffle.s.sol:RaffleScript --fork-url http://localhost:8545 --private-key "Use one from anvil list"

- simulate deployment to the chain
  - provide name of script
  - fork url is the port section of the socket displayed after anvil is executed
  - private key of the wallet deploying the contract

forge script script/Raffle.s.sol:RaffleScript --fork-url http://localhost:8545 --private-key "Use one from anvil list" --broadcast

- deploy onto the local chain

for read operations
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "getConfirmations()"

- contract address
- method being called

for transactions
cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "enterRaffle()" --value 1ether --private-key "Use one from anvil list"

- contract address
- method
- value tag to send ether amount (can be an integer read as wei or a string with a unit e.g 1ether 10gwei 0.01ether)
- private key of wallet transacting
