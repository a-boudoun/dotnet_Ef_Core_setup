# User Manual: LORDS NFT

## Minting NFTs
1. Open Remix.
2. Load the deployed BONITAS contract at `0xbE9ee9241910bAa900f2755677b2e58D78222C22`.
3. Call `safeMint`:
   - `to`: Your MetaMask address.
   - `uri`: Filebase gateway URL (e.g., `https://ipfs.filebase.io/ipfs/[JsonCID1]`).
   - Approve the transaction (~0.005 ETH gas).
4. Repeat for five NFTs (token IDs 6–10).

## Verifying Ownership
1. On Sepolia Etherscan, search the contract address.
2. Check “Contract” > “Read Contract”.
3. Call `ownerOf(6)` to confirm it returns your address.
4. Call `tokenURI(6)` to verify the metadata URL.

## Viewing NFTs
1. Go to OpenSea Testnet.
2. Connect MetaMask (Sepolia network).
3. Search `0xbE9ee9241910bAa900f2755677b2e58D78222C22`.
4. View NFTs (BONITAS #6–#10), with images, names (e.g., `Token42_1`), and artist `aboudoun`.
5. If images don’t load:
   - Check JSON `image` fields use Filebase gateway URLs.
   - Click “Refresh Metadata” on each NFT.
   - Allow 1–6 hours for OpenSea caching.

## Notes
- Metadata includes artist (`aboudoun`), titles with “42”, and Filebase URLs.
- Images are JPGs with “42” in filenames, stored on Filebase IPFS.