# LORDS: TokenizeArt NFT Project

## Overview
This is my ERC-721 NFT collection for the 42 school TokenizeArt project, created by aboudoun. Deployed on Sepolia Testnet, it consists of five unique NFTs with images and metadata stored on Filebase IPFS. Each NFT incorporates "42" in its image name (e.g., `image1_42.jpg`) and metadata title (e.g., `Token42_1`), with artist credit to aboudoun, fulfilling all project requirements.

## Design Choices
- **Blockchain**: I chose Sepolia Testnet for its stability, active developer support, and free test ETH from faucets like QuickNode and Alchemy, avoiding real money as per the project rules.
- **IPFS Storage**: Filebase was selected for its user-friendly interface, free 5GB tier, and HTTP gateway URLs (e.g., `https://ipfs.filebase.io/ipfs/...`), ensuring fast metadata loading on OpenSea Testnet. I opted for gateway URLs over `ipfs://` links for instant visibility during evaluation.
- **Solidity Version**: I used `0.8.27` for compatibility with OpenZeppelin 5.0.0 and Remix, offering modern features and security fixes.
- **Contract Name**: BONITAS ties into the project's theme, with symbol BNT for brevity.
- **Security**: OpenZeppelin’s `Ownable` and `ERC721URIStorage` provide audited, secure code. Minting is restricted to me (aboudoun) to demonstrate ownership control.
- **Tools**: Remix was chosen for its simplicity and built-in deployment features, ideal for a quick, reliable setup on Sepolia.

## Contract Details
- **Name**: BONITAS
- **Symbol**: BNT
- **Network**: Sepolia Testnet
- **Address**: `0xbE9ee9241910bAa900f2755677b2e58D78222C22`
- **Features**: Owner-only minting, Filebase IPFS metadata, ERC-721 standard.

## Project Structure
```
.
├── README.md
├── code/
│   └── contract.sol
├── deployment/
│   └── deploy_instructions.md
├── mint/
│   ├── image1_42.jpg
│   ├── image2_42.jpg
│   ├── image3_42.jpg
│   ├── image4_42.jpg
│   ├── image5_42.jpg
│   ├── json1_42.json
│   ├── json2_42.json
│   ├── json3_42.json
│   ├── json4_42.json
│   └── json5_42.json
├── documentation/
│   └── user_manual.md
```

## Files
- **Images**: `image1_42.jpg` to `image5_42.jpg` (500x500 JPGs, "42" in filenames).
- **Metadata**: `json1_42.json` to `json5_42.json` (stored on Filebase with gateway URLs).
- **Contract**: `code/contract.sol` (Solidity code with comments).

## Setup Overview
1. Deploy `contract.sol` on Sepolia via Remix.
2. Mint five NFTs using Filebase gateway URLs.
3. Verify the contract on Sepolia Etherscan.
4. View NFTs on OpenSea Testnet.

**P.S.** For decentralization, `ipfs://` links are preferred for metadata, but this proof-of-concept uses Filebase gateway URLs (e.g., `https://ipfs.filebase.io/ipfs/...`) to load images and metadata instantly on OpenSea Testnet for quick evaluation.

For detailed steps, see `deployment/deploy_instructions.md` and `documentation/user_manual.md`.