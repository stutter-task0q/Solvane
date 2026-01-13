# Solvane

## Overview
Solvane is a read-only inspection repository designed to validate connectivity, visibility, and explorer references on Base Sepolia. It is intentionally minimal and avoids all transaction or signing capabilities.

Built for Base.

## Purpose
The purpose of this repository is to provide a controlled reference implementation for:
- reading wallet-related data without authorization side effects
- validating Base Sepolia RPC responses
- confirming explorer address and block visibility
- serving as a baseline for tooling validation before more advanced integrations

## Operational Scope
Solvane focuses exclusively on inspection and verification tasks. It never attempts to mutate onchain state and does not require private keys or signatures.

## Internal Flow
1) Initialize Base Sepolia constants and explorer roots  
2) Discover wallet addresses through wallet abstraction logic  
3) Read balances using public RPC assumptions  
4) Read basic block metadata  
5) Check bytecode presence at provided addresses  
6) Output structured data suitable for reports or validation logs  

## Base Sepolia Details
- Network: Base Sepolia
- chainId (decimal): 84532
- Explorer: https://sepolia.basescan.org

## Repository Structure
- README.md
- app/Solvane.py
- package.json
- contracts/SolvaneInspector.sol
- config/base-sepolia.json
- samples/targets.json

## testnet deployment (base sepolia)
the following deployments are used only as validation references.

network: base sepolia  
chainId (decimal): 84532  
explorer: https://sepolia.basescan.org  

contract SolvaneInspector.sol address:  
0x0D7A4B9E2C1F6A8D3E5B7C9A1F2D4E6C8B0A3D5F 

deployment and verification:
- https://sepolia.basescan.org/address/0x0D7A4B9E2C1F6A8D3E5B7C9A1F2D4E6C8B0A3D5F 
- https://sepolia.basescan.org/0x0D7A4B9E2C1F6A8D3E5B7C9A1F2D4E6C8B0A3D5F/0#code  

these deployments provide a controlled environment for validating base tooling and read-only onchain access prior to base mainnet usage.

## License
Apache License 2.0

## Author Contacts
- GitHub: https://github.com/stutter-task0q

- X: https://x.com/gustavosilva014

- Email: stutter_task0q@icloud.com
