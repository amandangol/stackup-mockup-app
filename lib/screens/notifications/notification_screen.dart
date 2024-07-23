import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Notifications', style: GoogleFonts.poppins()),
        //
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          indent: 60,
          endIndent: 60,
          color: colorScheme.secondary,
        ),
        itemCount: sampleNotifications.length,
        itemBuilder: (context, index) {
          return NotificationItem(notification: sampleNotifications[index]);
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Notification notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // TODO: Implement delete action
      },
      child: ListTile(
        leading: _buildNotificationIcon(),
        title: Text(notification.title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Text(notification.message, style: GoogleFonts.poppins()),
        trailing: Text(
          notification.time,
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
        ),
        onTap: () {
          // TODO: Implement notification tap action
        },
      ),
    );
  }

  Widget _buildNotificationIcon() {
    IconData iconData;
    Color iconColor;

    switch (notification.type) {
      case NotificationType.info:
        iconData = Icons.info;
        iconColor = Colors.blue;
        break;
      case NotificationType.warning:
        iconData = Icons.warning;
        iconColor = Colors.orange;
        break;
      case NotificationType.alert:
        iconData = Icons.error;
        iconColor = Colors.red;
        break;
      case NotificationType.updates:
        iconData = Icons.push_pin;
        iconColor = Color.fromARGB(255, 179, 55, 48);
        break;
      case NotificationType.reward:
        iconData = Icons.money;
        iconColor = Colors.green;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, color: iconColor),
    );
  }
}

enum NotificationType { info, warning, alert, updates, reward }

class Notification {
  final String id;
  final String title;
  final String message;
  final String time;
  final NotificationType type;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.type,
  });
}

final List<Notification> sampleNotifications = [
  Notification(
    id: '1',
    title: 'New Quest Available',
    message: 'A new quest "Towards Wallet Solutions in Web3" is now available.',
    time: '2m ago',
    type: NotificationType.info,
  ),
  Notification(
    id: '2',
    title: 'Campaign Ending Soon',
    message:
        'The "GCP-Powered AI Solutions for Building on aelf" campaign ends in 24 hours.',
    time: '1h ago',
    type: NotificationType.warning,
  ),
  Notification(
    id: '3',
    title: 'Reward Claimed',
    message:
        'You have successfully claimed your reward for completing the "Developing Web Applications with Flask" quest.',
    time: '2h ago',
    type: NotificationType.reward,
  ),
  Notification(
    id: '4',
    title: 'Account Security Alert',
    message:
        'Unusual activity detected on your account. Please verify your recent actions.',
    time: '1d ago',
    type: NotificationType.alert,
  ),
  Notification(
    id: '5',
    title: 'Quest Starting Soon',
    message:
        'The quest "Introduction to Solidity" starts in 1 hour. Get ready!',
    time: '55m ago',
    type: NotificationType.info,
  ),
  Notification(
    id: '6',
    title: 'Discord Quiz Reminder',
    message:
        'Don\'t forget! The Web3 Knowledge Quiz starts in 30 minutes on our Discord server.',
    time: '3h ago',
    type: NotificationType.info,
  ),
  Notification(
    id: '7',
    title: 'Upcoming Webinar',
    message:
        'Join us tomorrow for a webinar on "The Future of DeFi" with guest speaker Alex Johnson.',
    time: '5h ago',
    type: NotificationType.updates,
  ),
  Notification(
    id: '8',
    title: 'Game Night Alert',
    message:
        'It\'s time for our monthly Crypto Trivia Night! Join the voice channel in 15 minutes.',
    time: '6h ago',
    type: NotificationType.info,
  ),
  Notification(
    id: '9',
    title: 'Quest Submission Approved',
    message:
        'Great job! Your submission for "Building a DApp on Ethereum" has been approved.',
    time: '1d ago',
    type: NotificationType.reward,
  ),
  Notification(
    id: '10',
    title: 'New Partnership Announcement',
    message:
        'StackUp has partnered with BlockchainX to bring you exclusive content and opportunities!',
    time: '2d ago',
    type: NotificationType.updates,
  ),
  Notification(
    id: '11',
    title: 'Community Challenge',
    message:
        'New community challenge: Create a unique NFT. Submit your entries by next Friday!',
    time: '3d ago',
    type: NotificationType.info,
  ),
  Notification(
    id: '12',
    title: 'Quest Series Completed',
    message:
        'Congratulations! You\'ve completed the entire "Mastering Solidity" quest series.',
    time: '4d ago',
    type: NotificationType.reward,
  ),
  Notification(
    id: '13',
    title: 'Platform Maintenance',
    message:
        'StackUp will undergo maintenance on Sunday from 2 AM to 4 AM UTC. Some features may be unavailable.',
    time: '5d ago',
    type: NotificationType.warning,
  ),
  Notification(
    id: '14',
    title: 'New Blog Post',
    message:
        'Check out our latest blog post: "5 Emerging Trends in Blockchain Technology"',
    time: '6d ago',
    type: NotificationType.updates,
  ),
  Notification(
    id: '15',
    title: 'Limited Time Offer',
    message: 'Complete any quest in the next 24 hours and receive double XP!',
    time: '1w ago',
    type: NotificationType.reward,
  ),
];
