# Interoperability

Theorethical lesson, less practical.

It's not easy to move assets between chains. It's harder than expected.

With technology we take it for granted to move object between systems.

There were one chain, bitcoin only later on few couple emerged.

Now there is desire to move blockchains more easily. It was initially just an academic exercise. 

Now it's changed and since DeFi became so dominant, it made a shift on how interoperability is important and is having a bigger role.

This particularly after Summer DeFi.

There're pools, how is it possible to easily move assets.

The whole area is quite new and unstable. Novilty projects. This led to a great diversity but also fragmentation. Few smaller ones might interact between each others.

Semantic and technical interoperability. But also legal interoperability.

Let's focus on tech and semantic.

The internet of blockchain is less function of this.

Scalability and ability to made offload tx and processes but still able to participate in the operations.

Few protocols proposed depends on the type, CCCP and CBCP.

## CCCP
Homogeneous that works in the same way. Often it's the same steps:
- burn assets
- commitment given to the target blockchain
- targeted blockchain will mint the asset and create it with the right amount

## CBCP
This tends to be more abstract for what it's trying to do. Some fn might not be all there. Also be careful of mistrustful nodes.

## Approaches

Idea of Sidechains. Looking at scalability. There'a main chain maintaining assets and through a communication protocol transfer assets between the main and a side chain.

The second layer can allow off chain tx.

### Notary schemes

An entity that monitors few chains. In centralised exchanges. They run audit books, moving assets between chains, all based on side chains. eg. 0x.

### HTLC
Hash time lock contract, used in bitcoin. Allow to provide atomicity.

### Blockchain of Blockchains
Try to solve at a large scale solution. E.g. polkadot and cosmos. They both use IBC.

### Hybrid connectors
Abstract some functionality only.

--

Some specific examples.

## XClaim

Implements Tokens backed from another chain.

They provide secure audit logs. Fraud proofs.


## Other brides

Near<>Ether

Ether<>Bitcoin

Example: Kyber

They link together particular projects. The motivation is about providing and having liquidity in different sources.

## Interledger

A project around for quite a while. They focus, reducing the scope only on payment. Like seeing from a human context. Good use case. Their approach is quite beneficial. They look at payments.


## Cosmos

Larger in its scope on what it's trying to achieve.

It's interesting to see. They are promoting the DeFi aspects, having their own Dex, as well stacking etc.

The consensus mechanism is Tendermint, a BFT type mechanism. The scalability will have an effect.

They are defined into "Zones" (or shards in Ethereum terms), specific per applications. Defined using the Cosmos SDK. On top of their own Cosmos Hub. Interacting using the Inter blockchain communication protocol, IBCP.

Zones do not monitor directly other Zones, tho they can go through the Cosmos Hub.

IBCP it's develop on its own, like a network layer. It's a way routing data in other chains. In an accurate and secure way.

We will send proof of existence and expect other proofs.

There're several layers defined.

The communication protocol composed with:
- Clients, they have an id to identify in the network.
- Connections.
- Proofs and paths.


There are some special zones to allow connections to specific blockchain that are outside the cosmos ecosystem. Like Ethereum. 
Allowing to interact outside. Using Peg Zones.

It's a rich way to provide interoperbility.

## Polkadot

Another large entity on the interoperability.
It came out from Ethereum, one of the creator of the yellow paper.

Nominated proof of stake, similar as consensus.


### Cross-Consensus Message Format (XCM)

Rely on Messages vertically. Upward and downward throw relays.

### Example
Smart contract do not need to share much between each other. Interact contracts between chains.

Notable good parachains.

## Parachains

Moonbeam is an EVM compatible, so allow to use with the smart contracts in solidity. It's like Rinkeby for main net.

Allow to move apps from Ethereum to the Polkadot ecosystem.

## Comparison
- Cosmos: Scalability is 1k tx per second. BFT consensus is the bottleneck. Performances degraded on with more validators.
- Polkadot is 1.5 tx per second. Has a computation slots available that allow to increase this. Allow 1000 validators in the relay chain.

## Harmony
Can connect proof of work and proof of stake in another blockchain.

## Yieldly (Algorand)


# Summary

Every year was the year of interoperability. 

Because of DeFi wanting to swap between chain there's a lot of incentives and motivation. The best is to build a bridge, like Harmony or Yieldly, like simple bridges. Smaller solutions and specific, instead of Cosmost/Polkadot that provide an ecosystem of chains.
