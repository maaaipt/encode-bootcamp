
# EVM
Storage and accounts, transactions, languages, clients and mining, how to connect to a test network.

Good resources to understand more about the EVM. Three papers to understand more, yellow paper is more advanced.

## Data Structures.
Uses Merkle Trees. With an array of trees. There are 3 main areas, world state, transaction and receipt. Bloom filter, probabilistic data structure, it can give back a probability of an item being in a data structure.
Ommer (or uncle) blocks. Different form Bitcoin, give a reward also to block not canonical chains. Reason being linked to, due to high frequency of block generation, to incentives generate blocks anyway. It has to be in the latest 6 blocks.

## Accounts
There are two accounts, externally owned and contract accounts. There were theory about them to be indistinguibile, but there's difference. Extenrally owned accounts can initiate a transaction (they can still be automated), while smart contracts no. It's not possible to have a timer and initiate a transaction from a contract.

## 
Balance, storage, code hash (for smart contract), nonce (number of transaction from the account).

Transactions
It has some property.
- Transaction is well formed
- Look at the nonce
- Account calculations, tx fees
- 

Transactions
- there's competition for transactions to be included in blocks
- Miners will choose the order of them
- Miners choose which tx go in a block and they can add their own
- Incentives behaviour for miners
- It might be needed to put high tips to incentives priority

Transactions are atomic, flash loans can exist.
Etherscan being a valid tool to check tx. Alternative is the Graph. A way to indexing data and make them available, run queries on ethereum.

## EVM
Stack machine has a max size of 1024. Calling one fn from another, might end up hitting the limit of the stack. Is not the best designed. Size being limited 256bits, facilitate this. Gas optimisation. Memory is transient, lost after a tx. Storage is preserved, part of the global state.
OP code, store/loading in the store, program execution, jump, stop, etc.

## EVM Languages
Solidity (most popular), LLL (patchy history, one of the first), Vyper (second most popular), Yul, FE, etc.
They change overtime, might not be maintained anymore. Came from after the DAO hacks, criticise Solidity for not being very easy and allow lacks. Other new languages came out to facilitate auditing.
YUL lower level than solidity. Optimising the code by hand rather than the compiler.
FE, new language, take inspiration by python and rust. Not far from Viper.

Clients
- Geth, not maintained much.
- OpenEtherem, built in rust
- Nethermind
- best, under the hyper ledge umbrella, most recent client

Start a node in Ethereum can change by type.
Sync modes:
- Full. Verify the validity of the blocks. This requires a great amount of data and high spec. ~4TB.
- Fast. without keeping all the data
- Light.
- Beam sync.
- Header sync.

Miners
Run Ethash. 4GB has to be held in memory. ASIC chips are not suitable for bitcoin. They tried to make more accessible.

Test networks
- rinkeby
- ropsten
- Koven
- görli
There were DOS on them, so most moved into a proof of authority.



