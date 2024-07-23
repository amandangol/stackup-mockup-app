import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CampaignCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String rewardPool;
  final String questCount;
  final String startDate;
  final String endDate;
  final String endsInDay;
  final String endsInHours;
  final String endsInMins;
  final String campaignStatus;
  final String image;
  final VoidCallback? onTap;
  final bool hasDays;

  const CampaignCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.rewardPool,
    required this.questCount,
    required this.startDate,
    required this.endDate,
    required this.endsInDay,
    required this.endsInHours,
    required this.endsInMins,
    required this.campaignStatus,
    required this.image,
    this.onTap,
    this.hasDays = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          GestureDetector(
            onTap: onTap,
            child: ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              contentPadding: const EdgeInsets.all(8),
              tileColor: colorScheme.secondary,
              title: Text(title, style: textTheme.titleMedium),
              trailing: _buildStatusChip(colorScheme, textTheme),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subTitle, style: textTheme.bodyMedium),
                  const SizedBox(height: 15),
                  _buildInfoRow(colorScheme, textTheme),
                  const SizedBox(height: 15),
                  _buildDateRow(colorScheme, textTheme),
                  const SizedBox(height: 10),
                  if (hasDays) ...[
                    Text("Ends in",
                        style: textTheme.bodyMedium
                            ?.copyWith(color: colorScheme.primary)),
                    _buildCountdownRow(colorScheme, textTheme),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: campaignStatus == "Past"
            ? colorScheme.surface
            : const Color.fromARGB(255, 209, 243, 210),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(campaignStatus,
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary)),
    );
  }

  Widget _buildInfoRow(ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("$rewardPool Reward Pool",
            style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.inversePrimary,
                fontWeight: FontWeight.w500)),
        Text("$questCount Quests",
            style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.inversePrimary,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildDateRow(ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDateColumn("Start", startDate, colorScheme, textTheme),
        _buildDateColumn("End", endDate, colorScheme, textTheme),
      ],
    );
  }

  Widget _buildDateColumn(
      String label, String date, ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      children: [
        Text(label,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary)),
        const SizedBox(height: 5),
        Text(date,
            style: textTheme.bodyMedium
                ?.copyWith(color: colorScheme.inversePrimary)),
      ],
    );
  }

  Widget _buildCountdownRow(ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      children: [
        _buildCountdownUnit(endsInDay, "Days", colorScheme, textTheme),
        const SizedBox(width: 10),
        _buildCountdownUnit(endsInHours, "Hours", colorScheme, textTheme),
        const SizedBox(width: 10),
        _buildCountdownUnit(endsInMins, "Mins", colorScheme, textTheme),
      ],
    );
  }

  Widget _buildCountdownUnit(String value, String label,
      ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(value,
              style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold)),
        ),
        if (hasDays)
          Text(label,
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.inversePrimary)),
      ],
    );
  }
}
