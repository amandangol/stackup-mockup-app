// campaign_model.dart
import 'package:flutter/material.dart';

class Campaign {
  final String image;
  final String title;
  final String subTitle;
  final String campaignStatus;
  final String rewardPool;
  final String questCount;
  final String startDate;
  final String endDate;
  final String endsInDay;
  final String endsInHours;
  final String endsInMins;
  final bool hasDays;
  final String description;
  final String learningOutcomes;
  final List<Quest> quests;

  final VoidCallback onTap;

  Campaign({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.campaignStatus,
    required this.rewardPool,
    required this.questCount,
    required this.startDate,
    required this.endDate,
    required this.endsInDay,
    required this.endsInHours,
    required this.endsInMins,
    required this.hasDays,
    required this.description,
    required this.learningOutcomes,
    required this.quests,
    required this.onTap,
  });
}

// Sample static data
List<Campaign> campaigns = [
  Campaign(
    image: "images/gcp.png",
    title: "GCP-Powered AI Solutions for Building on aelf",
    subTitle:
        "Create a tool that leverages AI to simplify the development process on aelf",
    campaignStatus: "Ongoing",
    rewardPool: "\$2500",
    questCount: "1",
    startDate: "Jul 16, 2024, 12:00",
    endDate: "Jul 30, 2024, 12:00",
    endsInDay: "8",
    endsInHours: "21",
    endsInMins: "26",
    hasDays: true,
    description:
        "StackUp is partnering with aelf and Google Cloud Platform (GCP) to launch an AI-driven bounty challenge designed to enhance the development experience on the aelf blockchain. Our goal is to to integrate AI technology into the development tools used on aelf, enhancing productivity and streamlining developer workflows. 🚀",
    learningOutcomes:
        "Create a tool that leverages AI to simplify the development process on aelf",
    quests: [
      Quest(
        title: "GCP-Powered AI Solutions for Building on aelf",
        endDate: "Ends in 8 Days 19 Hrs 27 Mins",
        reward: "\$2500 Reward",
        players: 751,
      ),
    ],
    onTap: () {},
  ),
  Campaign(
    image: "images/wallet_campaign.png",
    title: "Towards Wallet Solutions in Web3",
    subTitle:
        "Enhance your Web3 knowledge by learning and applying newly gained knowledge about wallets for Web3 development.",
    campaignStatus: "Ongoing",
    rewardPool: "Mixed",
    questCount: "4",
    startDate: "Jul 19, 2024, 12:00",
    endDate: "Aug 10, 2024, 12:00",
    endsInDay: "19",
    endsInHours: "21",
    endsInMins: "21",
    hasDays: true,
    description:
        "How is a wallet a solution for interacting with the blockchain? What even are wallets? Are they the leather wallets you carry around in your pocket?In this campaign, we'll be learning about wallets. These include an overview of wallets such as their importance and the types of wallets, how to use them in transactions using a testnet faucet, and finally, how to integrate wallets using Wallet Modals for Web3 development from providers and how these providers solve and accelerate Web3 development.",
    learningOutcomes:
        "By the end of this campaign, you will be able to Explain the functions of a wallet Understand the security features of a wallet Describe hot and cold wallets Build dApps with wallet integration for Web3 development",
    quests: [
      Quest(
        title: "Quest 1 - Overview of Wallets",
        endDate: "Ends in 15 Days 17 Hrs 50 Mins",
        reward: "None Reward",
        players: 453,
      ),
      Quest(
        title: "Quest 2 - Web3 Developer Guide to Wallet Integration",
        endDate: "Ends in 1 Days 17 Hrs 48 Mins",
        reward: "None Reward",
        players: 200,
      ),
      Quest(
        title: "Quest 3 - Building a dApp with a Wallet Modal",
        endDate: "Ends in 4 Days 17 Hrs 48 Mins",
        reward: "\$3 Reward",
        players: 50,
      ),
      Quest(
        title: "Bounty - List, Buy, and Sell Books dApp",
        endDate: "Ends in 4 Days 17 Hrs 48 Mins",
        reward: "\$5 Reward",
        players: 27,
      ),
    ],
    onTap: () {},
  ),
  // Campaign(
  //   image: "images/flask_campaign.png",
  //   title: "Developing Web Applications with Flask",
  //   subTitle: "",
  //   campaignStatus: "Past",
  //   rewardPool: "\$2950",
  //   questCount: "3",
  //   startDate: "Jun 28, 2024, 12:00",
  //   endDate: "Jul 14, 2024, 12:00",
  //   endsInDay: "",
  //   endsInHours: "",
  //   endsInMins: "",
  //   hasDays: false,
  //   onTap: () {},
  // ),
  Campaign(
    image: "images/threejs_campaign.png",
    title: "3D Web Design with ThreeJS",
    subTitle: "",
    campaignStatus: "Past",
    rewardPool: "Mixed",
    questCount: "3",
    startDate: "Jun 21, 2024, 12:00",
    endDate: "Jul 7, 2024, 12:00",
    endsInDay: "",
    endsInHours: "",
    endsInMins: "",
    hasDays: false,
    description:
        "We're excited to introduce a thrilling new element to our hackathon - Virtual Bounties! Regardless of where you're participating from, you now have the chance to embark on virtual quests that reward your creativity, skill, and knowledge with additional points. Dive into diverse challenges and climb up the leaderboard. Embrace this opportunity to showcase your talents, learn, and earn those extra points that could make all the difference.",
    learningOutcomes:
        "Virtual Bounties are online challenges that complement the 9 hackathons in The Global Hackathon Series. They allow participants from anywhere in the world to engage in unique, creative and skill-based tasks. These bounties are designed to reward innovation, problem-solving, and technical prowess with additional “globes”, enhancing your position on the overall leaderboard, thus increasing your chances of making it to the Grand Finals happening in Singapore in October 2024.",
    quests: [
      Quest(
        title:
            "Bounty: Build the next best Bitcoin-focused DeFi app on ZetaChain",
        endDate: "Ends in 11 Days 17 Hrs 46 Mins",
        reward: "\$1000 Reward",
        players: 334,
      ),
      Quest(
        title: "Bounty: Create the next best Gaming dApp on Aptos",
        endDate: "Ends in 11 Days 17 Hrs 46 Mins",
        reward: "\$1000 Reward",
        players: 156,
      ),
    ],
    onTap: () {},
  ),
  Campaign(
    image: "images/virtual_hackathon.png",
    title: "hackglobal 2024: Virtual Bounty Season 2",
    subTitle:
        "Enhance your Web3 knowledge by learning and applying newly gained knowledge about wallets for Web3 development.",
    campaignStatus: "Ongoing",
    rewardPool: "\n2000",
    questCount: "2",
    startDate: "Jul 5, 2024, 12:00",
    endDate: "Aug 2, 2024, 12:00",
    endsInDay: "11",
    endsInHours: "20",
    endsInMins: "26",
    hasDays: true,
    description:
        "We're excited to introduce a thrilling new element to our hackathon - Virtual Bounties! Regardless of where you're participating from, you now have the chance to embark on virtual quests that reward your creativity, skill, and knowledge with additional points. Dive into diverse challenges and climb up the leaderboard. Embrace this opportunity to showcase your talents, learn, and earn those extra points that could make all the difference.",
    learningOutcomes:
        "Virtual Bounties are online challenges that complement the 9 hackathons in The Global Hackathon Series. They allow participants from anywhere in the world to engage in unique, creative and skill-based tasks. These bounties are designed to reward innovation, problem-solving, and technical prowess with additional “globes”, enhancing your position on the overall leaderboard, thus increasing your chances of making it to the Grand Finals happening in Singapore in October 2024.",
    quests: [
      Quest(
        title:
            "Bounty: Build the next best Bitcoin-focused DeFi app on ZetaChain",
        endDate: "Ends in 11 Days 17 Hrs 46 Mins",
        reward: "\$1000 Reward",
        players: 334,
      ),
      Quest(
        title: "Bounty: Create the next best Gaming dApp on Aptos",
        endDate: "Ends in 11 Days 17 Hrs 46 Mins",
        reward: "\$1000 Reward",
        players: 156,
      ),
    ],
    onTap: () {},
  ),
];

class Quest {
  final String title;
  final String endDate;
  final String reward;
  final int players;

  Quest({
    required this.title,
    required this.endDate,
    required this.reward,
    required this.players,
  });
}
