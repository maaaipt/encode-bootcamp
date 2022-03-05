## MEV
Simple contract in the example video. Deploys to the main net, being the only person knowing the contract. There are generic running bots that looks at the transaction in the mempool and see if they run those transactions (in their machine seeing if they can get a profit locally and decide to deploy a new modified tx to get a reward) as they were their own account. Order of the transaction in important. Take the visible transaction and created their own tx and submitted that, going ahead putting a higher gas price (miner order per gas price). There're teams to look into flashbots. They always existed but they weren't a problem. With summer of defi the problem has increased.

## Front-running attacks
Three types of attacks. e.g. Alice (good guy) and Mallory (bad guy). Displacement attack. See and try to go ahead. Insertion attack, e.g. binance smart chain, few tx, when someone wants to buy some tokens, the attacker submits in a mempool, they make a profit as a token change price, selling it first and buying it later for cheap. Interacting with a dex it's worth to be careful if there's a big slippage. Suppression attack, delay a tx for some reason. In the same block.

## Ethereum is a dark forest
Came from a book. Somebody sent by mistake to someone else, to the wrong address and wanted to get them back. The person knew that they were, worth 12k$. If you put a tx someone will jump ahead and get the tokens.

## Escaping the dark forest
Another story. He does a lot of research and saving a lot of smart contract from having bugs. The issue of teams being anonymous can be about trust or even getting in touch about people.

Private network for miners, to communicate with them, the Taichi Network.

## Illuminating the dark forest
Article

## EIP 1559
Potential mitigation. Trying to change the miner incentive. But it doesn't seem to make much difference. Flashbots alpha. Provide a channel to flag cases. MEV geth, provides incentive as bundling tx, instead of using the normal get. Mistx. Secret swap, allows secrecy in tx. Cow Swap, is a dex aggregator.

## Who is doing this?
Miners doesn't look like are doing their transactions (even if they can be). Moving to proof of stake could be that it happens less often, at least from miners. To avoid being slashed form doing something malicious.