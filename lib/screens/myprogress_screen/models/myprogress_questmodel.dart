// quest_record.dart
class OngoingQuestRecord {
  final String title;
  final String status;
  final String submissionStatus;
  final String endDate;

  OngoingQuestRecord({
    required this.title,
    required this.status,
    required this.submissionStatus,
    required this.endDate,
  });
}

// past_quest_record.dart
class PastQuestRecord {
  final String title;
  final String status;
  final String rewardStatus;
  final String reward;

  PastQuestRecord({
    required this.title,
    required this.status,
    required this.rewardStatus,
    required this.reward,
  });
}

List<OngoingQuestRecord> onGoingquestRecords = [
  OngoingQuestRecord(
    title: "Quest 1 - ABI Encoding & Decoding",
    status: "Ongoing",
    submissionStatus: "Submitted",
    endDate: "July 23, 2024, 09:45",
  ),
  OngoingQuestRecord(
    title: "Quest 3 - High vs Low Level Calls in Solidity",
    status: "Ongoing",
    submissionStatus: "Submitted",
    endDate: "July 23, 2024, 09:45",
  ),
  OngoingQuestRecord(
    title: "Bounty - Inspecting On-Chain Functions Involving Calls",
    status: "Ongoing",
    submissionStatus: "In Progress",
    endDate: "July 23, 2024, 09:45",
  ),
  OngoingQuestRecord(
    title: "Quest 2 - Smart Contract Development Tools",
    status: "Ongoing",
    submissionStatus: "Submitted",
    endDate: "July 23, 2024, 09:45",
  ),
  OngoingQuestRecord(
    title: "GCP-Powered AI Solutions for Building on aelf",
    status: "Ongoing",
    submissionStatus: "In Progress",
    endDate: "July 30, 2024, 09:45",
  ),
  OngoingQuestRecord(
    title: "Bounty: Create the next best Gaming dApp on Aptos",
    status: "Ongoing",
    submissionStatus: "In Progress",
    endDate: "August 2, 2024, 09:45",
  ),
  OngoingQuestRecord(
    title: "Bounty: Build the next best Bitcoin-focused DeFi app on ZetaChain",
    status: "Ongoing",
    submissionStatus: "In Progress",
    endDate: "August 2, 2024, 09:45",
  ),
  OngoingQuestRecord(
    title: "Quest 1 - Overview of Wallets",
    status: "Ongoing",
    submissionStatus: "Submitted",
    endDate: "August 6, 2024, 09:45",
  ),
];

// List of Past Quest Records
List<PastQuestRecord> pastQuests = [
  PastQuestRecord(
    title: "ERC1155 Fundamentals",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$5",
  ),
  PastQuestRecord(
    title: "Diving Deeper into the ERC1155 Token Standard",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$5",
  ),
  PastQuestRecord(
    title: "Build a GraphQL API",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Meet Cody",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\4",
  ),
  PastQuestRecord(
    title: "Upload GraphQL API to GitHub",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Window Functions in SQL",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Intermediate SQL Queries",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Manipulating Date Time and Text Data",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Introduction to ZetaChain",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Write A Cross-Chain Swap Omnichain Contract",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Write Your First Omnichain Contract",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Quest 1: Integrating Passport Into Your Game",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Quest 2: Capstone: Build a Game with the Immutable zkEVM Part I",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Quest 3: Capstone: Build a Game with the Immutable zkEVM Part II",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Data Extraction and Preprocessing through Webscraping",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Sentiment Analysis Tools",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$5",
  ),
  PastQuestRecord(
    title: "Analyzing Stock Data Sentiments with NLP",
    status: "Past",
    rewardStatus: "Approved",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Bounty: Sentiment Analysis with Python Project",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$20",
  ),
  PastQuestRecord(
    title: "Introduction to Back End with ExpressJS",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Views and SSR with EJS",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Introduction to Databases",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Quest 1: ZetaChain - A Closer Look",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Quest 2: Creating an Omnichain Staking Contract",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Bounty: Upgrade StackUp Invaders",
    status: "Past",
    rewardStatus: "Rejected",
    reward: "\$0",
  ),
  PastQuestRecord(
    title: "Quest 3: Omnichain Staking from an EVM-Based Chain & Bitcoin",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Quest 2 - Deploying a Fungible Token on Sui",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$5",
  ),
  PastQuestRecord(
    title: "Quest 5 - Building a Marketplace dApp (Frontend)",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Quest 1 - Working with Sui Objects",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Quest 3 - Collections in Sui",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$5",
  ),
  PastQuestRecord(
    title: "Quest 4 - Building a Marketplace dApp (Backend)",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$5",
  ),
  PastQuestRecord(
    title: "Quest 1 - An Introduction to Ontology",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Bounty - Build Upon the Affinidi Capstone",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Quest 2 - Passwordless Login with Affinidi Login",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Quest 1 - Getting Started with Affinidi",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Quest 3 - One-click Onboarding with Affinidi Login",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Quest 4 - Capstone: Online Store",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\3",
  ),
  PastQuestRecord(
    title: "Quest 3 - Building a Cross-Chain Counter",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Quest 1 - Overview of Cross-Chain Messaging",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Quest 2 - Sending Your First Cross-Chain Message",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
  PastQuestRecord(
    title: "Quest 2 - Staking on Ontology I",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "This content is temporarily unavailable",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "Not Available",
  ),
  PastQuestRecord(
    title: "Bounty Challenge 1 - Data Identification and Submission",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$30",
  ),
  PastQuestRecord(
    title: "Quest 1: Introduction to Starknet",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2: Exploring Starknet Contract Ecosystem",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\3",
  ),
  PastQuestRecord(
    title: "Quest 4 - Build a Voting dApp (Backend)",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Introduction to aelf",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 5 - Build a Voting dApp (Frontend)",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Write Your First Smart Contract on aelf",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Navigating aelf Ecosystem",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Smart Contract Development on Ontology",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Creating an Omnichain NFT Smart Contract",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - ZetaChain Infrastructure Deep Dive",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Omnichain NFT Project Frontend Interface",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Dive into the Aptos Ecosystem",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Move on Aptos Part 2",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Move on Aptos Part 1",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Bounty - Article on Aptos as Your Choice Blockchain",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Staking on Ontology II",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Wallet Creation & Recovery",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Wallet Receive & Transfer of USDC",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 4 - Build a Custom Wallet Integration",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Introduction to Programmable Wallets",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Your First Application on Linera",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Creating a Fungible Token on Linera",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Introduction to Linera",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Bounty Challenge 1 - Circle Programmable Wallets Writeup",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Interact with Programmable Wallets",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Bounty Challenge 2 - Build Your Wallet",
    status: "Past",
    rewardStatus: "Rejected",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Intro to USDC and Programmable Wallets",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - A Tour on Rust Semantics",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Tiptoeing Into Rust",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Diving Into Important Core Concepts",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Bounty: Building a Customized RAG Model",
    status: "Past",
    rewardStatus: "Not Submitted",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 4 - Capstone Project: Movie Recommender Application",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Atlas Vector Search with Custom Embeddings",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 5 - Retrieval Augmented Generation using Atlas Vector Search",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Introduction to Atlas Vector Search",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Overview of MongoDB & Atlas Search",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Cross-chain Messages",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Composing Linera Applications",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Logging & Testing in Linera",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Creating an NFT",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Creating a Fungible Asset",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title:
        "Bounty: Create a DApp leveraging ZetaChain's omnichain and cross-chain messaging technology",
    status: "Past",
    rewardStatus: "Not Submitted",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Setting Up Your Development Environment",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Bounty: Ideathon",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Bounty: Build a Simple DeFi Swap dApp using Aptos TypeScript SDK",
    status: "Past",
    rewardStatus: "Not Submitted",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 – Forum App",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 – Routes and Controller",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Login Application",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Building a CLI application with Clap",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Learning The Rust Package Manager Cargo",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title:
        "Quest 3 - Code Refactoring, Integrating Software Tests and Error Handling",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Introduction to FastAPI",
    status: "Past",
    rewardStatus: "Rejected",
    reward: "",
  ),
  PastQuestRecord(
    title: "Enhancing the FastAPI Server",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Creating a Basic API Server with FastAPI",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 2 - Building The Library",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 - Foolproofing Your API Client Library",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 1 - Learn How Computers Communicate",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "",
  ),
  PastQuestRecord(
    title: "Quest 3 – ThreeJS Portfolio Website",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$1",
  ),
  PastQuestRecord(
    title: "Quest 2 – ThreeJS Coordinates and Camera Movement",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$2",
  ),
  PastQuestRecord(
    title: "Quest 1 – Get Started With ThreeJS",
    status: "Past",
    rewardStatus: "Rewarded",
    reward: "\$3",
  ),
];
