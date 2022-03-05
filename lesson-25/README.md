# Production

## How to document code

https://docs.soliditylang.org/en/v0.5.10/natspec-format.html

There's a standard, natspec, special comments to have some special infos (e.g. `///`, `/**  */`).

They are machine readable, allows to expose more info easily. (e.g. @dev tag).

Contracts, functions and events can be documented in natspec tools. Like title, author, notice (useful for info to an end user). This is an area that is lacking in blockchain ends. Users are not necessarily technical, things like this can be a small step towards what the contract is trying to achieve.

In detail about functions can have params, return type, etc.
When reading the code it could be reliable to see the name of the variable to understand the meaning, tho it can be misleading or wrong.

There's documentation generator, the solidity compiler generates a JSON file with metadata.

It's possible to do it as a separate step with the `solc --devdoc FILENAME.sol`.
There're few plugins available to make them user friendly.
- Remix plugins EthDoc
- Remix plugins Mdown, easily deployable on ipfs
- dodoc

https://docs.primitive.finance/protocol/overview is an example of the documentation.

End user can take advantage of it, e.g. MetaMask can use that with @notice and it will be able to swap variables and appear as a message.

Radspec is an alternative to natspec, selled as being more secure, but with the same interface. It can allow to allow any arbitrary JS code.


## Unit Test

Hardhat/truffle helps automating testing, particularly with high number of tests.

This is very useful to fork a mainnet with ganache-cli. It works as a node but locally, very similar on how to interact with a node in the network.
One great feature available is the `--fork` flag, passing a name of the main net (infura or better alchemy, etc.). This starts a blockchain as it was connected in the main net. It's almost a copy of the main net, allow to use accounts in the network. Testing out stablecoins.

This works for hardhat too.

What happens is that it will work for 30min and then requires to restart again. With alchemy provide an archive node, containing all the tx and blocks. Alchemy allows to do that.

Does it fork the whole network? it kind of does. It's possible to interact with all the contracts, not having lots of memory, but after a while it's more than that's possible to cope (for resources). The length of run is limited.

E.g. Homework: Fork the mainnet and use the uni swap contract.

Create a private network. Fork of the geth client. That is simple and useful.

## CI

Gitlab using truffle/hardhat. There're some docker images too.


## Audit

- Static analysis
- Manual code review
- Vulnerability databases

We will not rely on them much. Lots of false positive. Just cause the area is new, overtime it will improve. Use them but without much care.
Mythx is an example of service that provide it. It's not very useful when use a lot.
Slither is another one.

Solidity metrics is a plugin in VSCode. Fives graph and other visual tools to scope. Does not look specifically to vulnerabilities but can provide some checks.

Extropy have something too.

Ascendex (ex bitmex)

Rekt is a useful website to see the previous exploit.

Have as many people as possible to see the code. Better to have it in this way, rather than have a bug in production.

## Example of audit

Olympus DAO

Basic informations

Some introduction to the project on what it is and trying to do.

Info on how to categorise the vulnerabilities and methodology of work.

What items they look for.

The auditors try to find as much as they can. They will not go easy. Expect quite few items to be marked. They will send a report and then it's up to the devs do what they want, some things might not be needed to change.

e.g. initialisation checking that it's only happening once. Good practice to have an initial state and called initialised, but it should only ideally happen once in a controlled way. No one should be able to put back the state.



# Deployment

- Scripts
After passing the auditing it's fare to crept the deployment somehow, like hardhat/truffle.
It should be done easily and not manually done, better automated. Using first a test network before going live. It reduces the work done to deploy live.

- Etherscan Contract Verification
There're plugins to help on this. Give confidence to the users.

- Tenderley / OpenZeppelin Defender
Once it's running, monitor the project. See that the users are using it etc.

Tenderly useful, we had a talk somewhere. It's like etherscan with more functionalities. See the ABI, select the network, very easy user interface. There's a simulator to allow forking, similarly, simulate transactions. Allows forks too with different networks.
Local transactions useful for seeing mempool.
Gives monitor to network and analytics. Alert is quite useful for monitoring. Can provide different events. On alerts there can be actions, using APIs too.

Open Zeppelin can be very useful in a similar way. It can also use as a monitor tool.
