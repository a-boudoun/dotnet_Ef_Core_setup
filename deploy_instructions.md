# Deploy Instructions for LORDS NFT Contract

## 1. Get Sepolia Test ETH
- Visit a faucet like QuickNode or Alchemy.
- Enter your MetaMask wallet address (Sepolia network).
- Request ~0.1 Sepolia ETH for gas fees.

## 2. Deploy the Contract
- Open Remix.
- Create `contract.sol` in `code/` and paste the ERC-721 code (using `ERC721URIStorage`, `Ownable`).
- Set compiler to `0.8.27`.
- Under “Deploy & Run Transactions”, select “Injected Provider - MetaMask” (Sepolia).
- Set `initialOwner` to your MetaMask address.
- Click “Deploy” and approve the transaction (~0.01–0.03 ETH gas).
- Note the contract address (e.g., `0xbE9ee9241910bAa900f2755677b2e58D78222C22`).

## 3. Flatten the Contract
- Install Hardhat: `npm install --save-dev hardhat`.
- Run `npx hardhat` and create a JavaScript project.
- Copy `contract.sol` to `contracts/`.
- Flatten it: `npx hardhat flatten contracts/contract.sol > Flat_contract.sol`.
- Edit `Flat_contract.sol` to remove duplicate `SPDX-License-Identifier` lines.

## 4. Verify on Sepolia Etherscan
- Go to Sepolia Etherscan and search your contract address.
- Click “Contract” > “Verify and Publish”.
- Choose:
  - Compiler: `v0.8.27`.
  - License: MIT.
- Upload `Flat_contract.sol`.
- Encode `initialOwner` using Remix’s deployment data or an ABI encoder.
- Submit to verify the source code.

## 5. Next Steps
- Proceed to minting (see `documentation/user_manual.md`).