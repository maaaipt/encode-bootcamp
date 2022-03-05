# Advanced topic about Solidity

The latest docs have examples in remix.

Tool quite useful is the solidity-upgrade part of the compiler, automatically upgrade codes, have several modules based on the version.

There're some articles for different part of the language.

## Addresses

Looks at the hash of the address, provide a checksum. There're web3 tools that helps too.

## Address payable 
Some addresses can't receive payable, so it will throw an error if tried to. Define it explicitly with `payable`.

## Contract Addresses
Now depends on the byte code too, since Feb2019

## Function selectors
Referred from the polynetwork attack.

`this.f.selector` provide the signature of the function f().
It can be useful when calling functions. In a more flexible way. Call a function by its name, through ABI and the compiler, provides some help, but it can vary in any way.
Selectors helps to dynamically define them.

There're helpers method for this, like `abi.encodeWithSignature`
Using then the call function `address(contractAddress).call(payload)`.

Gives flexibility but brings a cost and risk of doing that. Perhaps check the polynetwork attack as an example.

Verify signature on chain is something useful for more complex cases.


## EIP712 and EIP2612
Are proposals. Latest standard for signing transactions and used securely.

Permit functions. Transactions are used securely, setup a domain separator. A piece of data that a contract provide that if someone is signing a tx it will have the right features, provides a unique id. Domain separator. Permit function is taken over. When interacting with uniswap, ERC20 there're some approved calls, for the DEX to use the token. It's cumbersome, it's ideal to setup that without the approval and spending gas for that. The EIP2612 allow this permit for that. Adds three functions, domain separator for security and identity, keep track of nonces to a particular address to avoid reply tx. The DeFi contract will use that. Traditional processs = approve and then an additional transfer for it that actually do the swap, paying extra gas. The permit process improves it, it signs a signature that is send to the protocol, once done the dex will receive the signature that has no gas fees, then happens the actual tx with gas fees that actually sends tokens.

A good article is available.

## Meta transactions
As a general idea, when designing app who is going to pay the transactions? Due to the high cost of a tx. Are the users not keen to use the service due to that?

An old version is deprecated, openGSN is instead preferred.

An alternative network will pay the transaction for that. Why would they want to do that? Has to be resolved.

It's also considered the privacy about that. Start increase privacy around that. Allow to improve onboarding to make that simple for the users.

We send tx to a relay, that goes to an hub, calling a pay master contract. That has the logic to who pays the tx. As we need to rationality for who pays. If that passes security is checked before going to the final contract (recipient contract). Usually these relay services, paying "for others", as the users do not need eth and instead the relay contract do/needs that.

