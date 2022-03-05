
How to upgrade the smart contracts. Things are quite different.
One approach is to not upgrade at all.
Fundamental part of the contracts are immutable. Drawback it's not possible to upgrade them 'easily'. How to change functionality to a contract. If we do that how do we migrate data, how to get the original data yet collected.

Open Zeppelin provide something. One option is to not upgrade them. Parametrising the contract to some extent. It's only possible to think and specify some of them.

Deploy a V2 contract, migrating manually data. Have two contracts and move data somehow from one and another. It only works if there's little data in the contract. It can be difficult and particularly costly, mostly for gas and time.

Registry contract. Similar to the naming service. Contract that own the latest version, when people wants to interact, they first go to the registry and then use the latest version of it. Easy to implement. Tho there're disadvantages. The ode in the Dapp. It can be seen from the user to an unfavourable one. This doesn't solve the migration problem, only the versioning of it.

Separate Code contract with functionality from the Code contract for the data. No issue on migratation. It can be difficult to do it practically.

Choose functionality at runtime, move them from contract to libraries.

Delegate Call. Runs in B but the state is in A. Proxy pattern. Another way to see it is: A uses B's code. Implementation  Contract can be seen as a library. To upgrade is a matter of updating the address of the implantation contract.

Universal upgradeable proxy standard. The implementation is still in the B contract, but the upgradable is in the proxy one. It's cheaper over time. Reasonable way to proceed, tho has some problems.
There're  some concerns to consider on how to write the code for the implementation contract and accessing/storing data. They have to be carefully defined as additions, no swapping of storage position should be allowed, as it will override data and read wrong data. Initialiser should only be called once. Move the storage into a mapping. Eternal Storage, the mappings allow to avoid overriding data, but it's not easy to see in the code.

Suggested is the UUPS plugin, using open zeppelin, hardhat, truffle. They deploy a proxy contract and an implementation contract. They will do it for you with plugins. Checking that the compatibility is done properly etc.

From a practical point of view is to start using the openZeppeling, using the UUPSUpgradable and Initializable. No contractor means that requires an initialise function, has to be done manually and it's to be done properly. Using upgradable contracts, they needs all the other interfaces/contracts to be compatible with that. HardHat and Truffle they provide their solutions too. UUPS seems to be a solid default, compared to transferable one.

Always use testing for the upgrade process too. To avoid not initialised solutions. 

There have been exploits around this subject, so it requires caution about that.

There're other options. E.g. Diamond pattern.
It allows to delegate individual functions to individuals contracts. It's hard to follow, using their terminology. From Trail of Bits Audit. Tho it's not an ideal solution as been over engineer, that might not be needed at this time.

When contracts were created, originally, the address of the deployer will depends on the nonce. This means it's possible to know what it will be the future nonce and forecast about that. Create2 use the bytecode and salt.