# EVM Chains

## Consensus

Nakamoto consensus.

Tendermint, it can be fast but it might not scale fast, it might be required other things for that. E.g. more nodes.

Avalanche has another mechanism.

Thundercore, their consensus is PaLA. There's a proposer and a committee. They send blocks to the voters, replying with a vote. Once 2/3 of voters are agreeing, it's notarised it.

Thurdcore hubs is quite mobile oriented. Thunder token, it's very cheap to do transactions on it. It's extremely low.

Developing on one chain can be convenient to then port in other ones.

Binance Smart Chain, have quite a centralised approach. Kind of Proof of authority. It supports EVM compatible.

Polkadot is particular, it's fully EVM compatible. Deploy on moonbeam. It has an upgradability concept.

Theta focus on video delivery. They have a scalable BFT. The classical one doesn't scale well on number of nodes and voting is complex with lots of them. They have a special protocol to reduce the messaging on it. If you can't scale well, it will become more centralised. So it's quite important to focus on that.

Avalanche, when they got claim a dedicated mechanism. The first part is a particular node when is making a decision, if accept a block/tx, it will pick random other nodes and see which decision have they made. If other nodes believe against the current state it will change its own state. This is done using all other nodes. They have a process, while receiving a transaction and checking with other nodes.
The network on its own have an EVM part compatible.