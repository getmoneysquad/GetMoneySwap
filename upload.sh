#!/bin/bash
mkdir -p contracts scripts

echo "// SPDX-License-Identifier: GPL-3.0\npragma solidity =0.8.19;\ncontract UniswapV2Factory {}" > contracts/UniswapV2Factory.sol
echo "// SPDX-License-Identifier: GPL-3.0\npragma solidity =0.8.19;\ncontract UniswapV2Router02 {}" > contracts/UniswapV2Router02.sol
echo "// SPDX-License-Identifier: MIT\npragma solidity =0.8.19;\ncontract WETH9 {}" > contracts/WETH9.sol

echo "async function main() {\n  console.log('Deploy script placeholder');\n}\nmain();" > scripts/deploy.js

echo 'require("@nomiclabs/hardhat-ethers");\nmodule.exports = {\n  defaultNetwork: "xrplEVM",\n  networks: {\n    xrplEVM: {\n      url: "https://rpc-evm-sidechain.xrpl.org",\n      chainId: 1440002,\n      accounts: process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY] : [],\n    },\n  },\n  solidity: "0.8.19",\n};' > hardhat.config.js

echo "# PRIVATE_KEY=your_private_key_here" > .env.example
echo "# Run the following:\n# git clone\n# cd GetMoneySwap\n# npm install\n# npx hardhat run scripts/deploy.js --network xrplEVM" > README.md

echo '{
  "name": "getmoneyswap",
  "version": "1.0.0",
  "scripts": {
    "deploy": "npx hardhat run scripts/deploy.js --network xrplEVM"
  },
  "devDependencies": {
    "hardhat": "^2.16.0",
    "@nomiclabs/hardhat-ethers": "^2.1.1",
    "ethers": "^5.7.2"
  }
}' > package.json
