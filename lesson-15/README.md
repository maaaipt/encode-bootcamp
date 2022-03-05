
## Some questions on the topic

As promised here's a copy of the Slido Q&A for Ethers

I thought the ABI was something specific to the EVM, but apparently there can be different ABI's for the same contract, depending on what system you used? Ethers vs web3 There can be different formats of ABI in ethers, but ultimately each format will translate the ABI into bytecode for the EVM.

what's Infura? Infura provides an Ethereum client so that you can interact with and query a blockchain in your project.

what is the await keyword needed for? An async function is when the data you are querying may not return immediately, therefore it isn't synchronous (this is due to the network's processes). Using an async function enables your code execution to 'pause' for the data specified after the 'await' keyword. If you forget to specify 'await' you won't retrieve data back from the network because the process was synchronous and you will get back a Promise.
Can you briefly summarize again the difference between nix hardhat node and geth? Specifically what does geth do that hardhat node doesn’t The hardhat node is essentially designed for development. So it is similar to Ganache. It is local host therefore there is not the usual delay you would have when interacting with a main chain. Geth connects and interacts with other nodes on a chain. Consensus mechanisms will be processed, but for a hardhat node it does not. This is likely to be because the project is in testing and development stage.

I dont understand what were meaning by tx reponse... so weve not actually sent a transaction using this yet? You have submitted the transaction but it has not yet been mined. The transaction response contains data regarding the transaction e.g. transaction hash. The transaction is receipt can be retrieved after the transaction has been mined.

what is the difference between the contract and the factory? Karol used the factory function and the output was a deployed contract? The Contract Factory sends a special type of transaction, an initcode transaction (i.e. the to field is null, and the data field is the initcode) where the initcode will be evaluated and the result becomes the new code to be deployed as a new contract. And the contract is just the contract to deploy 🙂

why is the test syntax different here than what we say before (expect instead of assert,...)? We are using assert from chai and not expect. You can use either but the way to write the test is slightly different