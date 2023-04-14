<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/achoudhury4927/forge-smartcontract-raffle">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Smartcontract Raffle</h3>

  <p align="center">
    Lesson 13 of Web3 Tutorial by Patrick Collins on FreeCodeCamp implemented with Foundry and Solidity instead of Hardhat and Javascript
    <br />
    <br />
    <br />
    <a href="https://github.com/achoudhury4927/forge-smartcontract-raffle">View Demo</a>
    ·
    <a href="https://github.com/achoudhury4927/forge-smartcontract-raffle/issues">Report Bug</a>
    ·
    <a href="https://github.com/achoudhury4927/forge-smartcontract-raffle/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

![Product Name Screen Shot][product-screenshot]

Lesson 13 of the <a href="https://www.youtube.com/watch?v=gyMwXuJrbJQ">Web3 Tutorial</a> by <a href="https://linktr.ee/PatrickAlphaC">Patrick Collins</a> on FreeCodeCamp implemented with foundry and solidity instead of hardhat and javascript. At the moment the current tests implemented do not cover integration tests only the smart contract tests. There are comments with some explanations above tests that I have added for my convenience which may be helpful to you too.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

- Foundry
- Solidity

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

To get a local copy up and running follow these simple steps. If at any point you are having trouble you can refer to the <a href="https://book.getfoundry.sh">Foundry Book</a>

### Prerequisites

The following commands are for Linux and Mac OS taken directly from this section of the <a href="https://book.getfoundry.sh/getting-started/installation">Foundry Book</a>

- Download foundryup
  ```sh
  curl -L https://foundry.paradigm.xyz | bash
  ```
- Install foundryup
  ```sh
  foundryup
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/achoudhury4927/forge-smartcontract-raffle.git
   ```
2. Install project dependencies
   ```sh
   forge install
   ```
3. Execute tests
   ```js
   forge test
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

I have dumped commands below to deploy and interact with Raffle.sol on a local chain below:

- To run a local node

  ```sh
  anvil
  ```

- Deploy onto the local chain

  ```sh
  forge script script/Raffle.s.sol:RaffleScript --fork-url http://localhost:8545 --private-key "Use one from anvil list" --broadcast
  ```

- Read operations

  ```sh
  cast call CONTRACT_ADDRESS "getConfirmations()"
  ```

- Transactions
  ```sh
  cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "enterRaffle()" --value 1ether --private-key "Use one from anvil list"
  ```

_For more examples, please refer to the <a href="https://book.getfoundry.sh">Foundry Book</a>_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Adil Choudhury - [@ItsAdilC](https://twitter.com/ItsAdilC) - contact@adilc.me

Project Link: [https://github.com/achoudhury4927/forge-smartcontract-raffle](https://github.com/achoudhury4927/forge-smartcontract-raffle)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/achoudhury4927/forge-smartcontract-raffle.svg?style=for-the-badge
[contributors-url]: https://github.com/achoudhury4927/forge-smartcontract-raffle/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/achoudhury4927/forge-smartcontract-raffle.svg?style=for-the-badge
[forks-url]: https://github.com/achoudhury4927/forge-smartcontract-raffle/network/members
[stars-shield]: https://img.shields.io/github/stars/achoudhury4927/forge-smartcontract-raffle.svg?style=for-the-badge
[stars-url]: https://github.com/achoudhury4927/forge-smartcontract-raffle/stargazers
[issues-shield]: https://img.shields.io/github/issues/achoudhury4927/forge-smartcontract-raffle.svg?style=for-the-badge
[issues-url]: https://github.com/achoudhury4927/forge-smartcontract-raffle/issues
[license-shield]: https://img.shields.io/github/license/achoudhury4927/forge-smartcontract-raffle.svg?style=for-the-badge
[license-url]: https://github.com/achoudhury4927/forge-smartcontract-raffle/blob/master/LICENSE
[product-screenshot]: images/tests.png
