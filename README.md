<div align="center">
  
# DenCrowd 🦪🚀🚀

[![Pull Requests Welcome](https://img.shields.io/badge/PRs-welcome-red.svg?style=flat)](http://makeapullrequest.com)
[![Made in Nigeria](https://img.shields.io/badge/made%20in-nigeria-008751.svg?style=flat-square)](https://github.com/acekyd/made-in-nigeria)

</div>

A Decentralized Fundraising platform

| Version                                      | Author                                          |
| -------------------------------------------- | ----------------------------------------------- |
| [Smart Conract](https://github.com/dencrowd) | [Njoku Emmanuel](https://github.com/khay-EMMA)  |
| ------------------------------------------   | ----------------------------------------------  |
| [Web](https://github.com/dencrowd)           | [Makwe Quintin](https://github.com/khay-EMMA)   |
| ------------------------------------------   | ----------------------------------------------  |
| [UI/UX Design](https://github.com/dencrowd)  | [Jennifer Apiaka](https://github.com/khay-EMMA) |

# Author 💖

Njoku Emmanuel

# Smart Contract Flow🥑🍕

- User(Admin) will start a Campaign or a Project for fundraising with a Specific Goal and Deadline💖

- Contributors will contribute to that project by sending the required Tokens(in this case Hydro).😋💵

- The User(Admin) will create a Spending Request every time he wants to use any amount from those funds😁

- The Contributors will vote for that Spending Request.😮

- If more than 50% of the total contributors vote for that request then the User(admin) will get permission to use the amount mentioned in the Spending Request🎉🔥

- The contributors can withdraw their Hydro if the required amount(Goal) was not raised within the Deadline💔

# Running Smart Contract with Truffle and ganache blockchain locally

```bash
# Clone Repo
$ git clone `https://github.com/Khay-EMMA/dencrowd.git`

# Install Dependencies
$ yarn install

```

## Connecting to Ganache and compiling contract

```bash
# Connect to ganache blockchain
$ ganache-cli -a

# Run Migration and deploy to local blockchain
$ truffle migrate

```
