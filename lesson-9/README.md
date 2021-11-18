# Security

- General Background
- think in a way that there are two layers
  - Attack at the protocol layer (consensus, etc..)
  - Application layers, attacks at the smart contracts (that people wrote) (in between actually) 

- 51% enough hashing power to trigger a chain reorganisation to a specific point and mutate the truth about the system
- this happens still on blockchain with low hashing power required

- MEV Miner extractable value. Miners are incentivised to. This has a large problem in Ethereum

- Selfish mining doesn't require much hashing powers (is more theorically that actually practically seen)

- Eclipse attack. This was possible to overwhelm of a node separating to the rest of the network. This has been patched so no much of a problem.

- Sybil node. Create multiple identities, adding economic cost.

- DDOS. Price of storage was not done correctly and it has been taken advantage of.

- Access Control is very important for smart contracts to operate. Initialisation particularly to setup, this might be sensitive and not done by anyone. Using constructor is controlled by who deploys it, but sometimes is not possible, like upgradable contracts. Using a function called initialiser, that it should only be called once. 

- Think about devops side, if we have keys, who is going to have them, how they will be controlled, etc. What happens if it's lost.

- Oracle risk. Smart Contracts relies on that, for example getting the price, this tho has to be thought in those cases where they can be . Flash loans, will multiple effects (DeFi).

- Rekt News. Lists recent attacks.

27:00

- Function selector. Calling functions in contracts. EVM has byte code that calls some functions. How to know where is it? The function selector is doing so. Giving a fingerprint/id for that and jumping to the appropriate point in the code.

31:00

- Vulnerable Contracts. Foreseen that sometimes there's a contract instead of another external account. Fallback calls. Ordering between line 3-5. An attacker can write its own contract that calls the withdraw. Balance is not changed but there's a move of eth. Contract didn't update the balance before the call)

37:00

- 20Apr2016 TheDAO using tokens to fund projects. The project had a lot of hope, but with great idea. Put a company in a smart contract, that contains all the rules of a company run itself. They could also had all the fund of the company. It could fund other projects, it was launch and buy tokens. If you wanted funding you could apply to the DAO itself. They could vote on that project and how much eth send to that project. It was extremely popular, by a company very active at the time. Month funding going on before using it. They had to accept certain terms and conditions. The legality to interact with the company is what the code does, that shows the truth about the contract, quite bold thing. Very decentralised. Lot of money. Before the ICO happening. 12M Eth as fund. The Slot team proposed a security update. 17Jun2016. This is not a drill. They couldn't go to an external account. An attacker moved the funding into a child dao. The gas cost was way lower. etc.

61:00

- Poly Network attack. Largest attack. 600M. Multiple chains, ethereal, polygon, binance. Wrong management in the poly network. Manager contract owned data contract. Exploit done with the manager contract, that had two functions, called in a valid way to cross chain transactions. Call functions in other chains. Using the function unintended form the purpose. Only the manager could call the functions. This contract wasn't used only for managing admin function, but also daily functions. etc.



Summary
- Careful of external calls. Particularly if the contract can do that. Be restricted to daily functions vs admin functions. Make it difficult to do some functions.




