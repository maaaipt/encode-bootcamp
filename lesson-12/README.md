MetaMask
- We will going away from remix and use other tools
- MetaMask uses its own network as a proxy. It can be passing towards ganache localhost.

Ethereum
- Apart from the EVM
- Whisper, messaging protocol, encrypted secure messages between nodes
- Swarm, alternatives to centralised storage. Overengineer, took long to come to production.

- First part to connect to a node to the network is through Web3 provider. Can also use web socket. ABI application binary interface, it's required to get details of functions. Contract address in the blockchain. It will work similarly on how the EVM calls methods, e.g. figuring out the address of a function.
- Write calls require tx fee, Gas.
- View calls are free

- There's no possibility of hiding data (e.g. it's possible to go back and calculate variable values looking at the history of all transactions). There's no point of restricting too much the access.

- Since EIP 1559 there're two parameters, one for gas burnt and one for the miner.

Nonce
- A way to specify a nonce, each account has one. This is supposedly strictly increasing. The node will check this to understand if that's greater or lesser than the one it already have. This check will allow the node to understand if it's missing transactions or not. The code that sends/receive transactions will have to consider and properly implement the nonce logic. Keep track of the nonce in the code. When creating a transaction it's possible to get the latest and act upon that.

Events
- Events are very useful in web3 code. There're few ways to interact with.
- Get all the past events. In case there're a lot of events, it might take a long time to retrieve. It's possible to filter them in the request, e.g. from which blocks.

- When RPC is allowed, any node can call functions on it. There're potential security risks. When starting an Ethereum node, it's possible to unlock the account through RPC calls. There're bots that look into Ethereum node, trying to drain Eths. Do not unlock nodes. Using IPC helps to not expose it directly (instead of HTTPS, SSL, etc.). It uses a stack.
Infura allows to provide a node to interact with.

- Create transactions and being able to find them, with code.