# PersonalLocker — GDG Blockchain Assignment  

**Name:** Nishant V.S  
**Registration Number:** 24MIA1101

---

##  Assignment Overview  

This project implements a Solidity smart contract called **`PersonalLocker`**, fulfilling the requirements of the GDG Blockchain Assignment. The contract allows the deployer (owner) to store a secret message and a password.  

The contract includes:  

- A **constructor** that sets the deployer as the owner, initializes the secret message, and sets a password.  
- An **owner-only update function** guarded by a password, which emits an event whenever the stored message is updated.  
- A **public view function** to read the message.  
- A **password reveal function** to display the stored password.  
- A **modifier** to restrict update access to only the owner.  
- **receive** and **fallback** functions.  

---

##  How the Contract Works  

The contract is initialized during deployment with three parameters: **owner (msg.sender)**, **initial message (my full name)**, and **password (kept secret)**.  

Only the **owner** can call the update function, and it requires the correct password. If successful, it updates the message, emits an event logging the old and new messages, and prevents password leakage.  

A separate function reveals the password when called. The `readMessage` function allows anyone to view the current stored message.  

---

##  Deployment & Interaction  

### Localhost Deployment  

- Deployed contract with initial message = *Nishant V.S*.  
- Updated message to **“Assignment Completed”** using the password.  

**Console Output:**  
```bash
Hardhat Ignition 🚀  

Deploying [ PersonalLockerModule ]  

Batch #1  
  Executed PersonalLockerModule#PersonalLocker  

[ PersonalLockerModule ] successfully deployed 🚀  

Deployed Addresses  
PersonalLockerModule#PersonalLocker - xxxxx
Sepolia Deployment
Deployed contract on Sepolia via Infura endpoint.


```

## Challenges Faced
While completing this assignment, the main challenges were setting up Hardhat Ignition for deployment and ensuring the .env configuration worked securely with Infura and my private key. Another challenge was handling password-protected updates in Solidity while ensuring the password was never leaked in the event logs.

Deploying on Sepolia also required obtaining test ETH and syncing with Infura. These steps helped me better understand contract security, Hardhat workflow, and real-world deployment practices.

---

