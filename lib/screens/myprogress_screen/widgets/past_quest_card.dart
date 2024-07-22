import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastQuestCard extends StatelessWidget {
  final String? questTitle;
  final String? questStatus;
  final String? rewardStatus;
  final String? reward;

  const PastQuestCard(
      {super.key,
      this.questStatus,
      this.questTitle,
      this.rewardStatus,
      this.reward});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colorScheme.secondary),
        ),
        child: ListTile(
          title: Text(
            questTitle!,
            style: GoogleFonts.poppins(
                color: colorScheme.inversePrimary, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            "${reward} Reward Earned",
            style: GoogleFonts.poppins(
                color: colorScheme.inversePrimary, fontWeight: FontWeight.w500),
          ),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 243, 210),
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  questStatus!,
                  style: GoogleFonts.poppins(color: colorScheme.primary),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  rewardStatus!,
                  style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
                ),
              ),
            ],
          ),
        ));
  }
}
