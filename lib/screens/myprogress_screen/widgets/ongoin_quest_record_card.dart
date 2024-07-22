import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OngoingQuestRecordsCard extends StatelessWidget {
  const OngoingQuestRecordsCard(
      {super.key,
      required this.colorScheme,
      this.submissionStatus,
      this.questendingDate,
      this.questStatus,
      this.questTitle});

  final ColorScheme colorScheme;
  final String? questTitle;
  final String? questendingDate;
  final String? questStatus;
  final String? submissionStatus;

  @override
  Widget build(BuildContext context) {
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
                color: colorScheme.inversePrimary,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          subtitle: Row(
            children: [
              Text(
                "Ending on",
                style: GoogleFonts.poppins(
                    color: colorScheme.inversePrimary, fontSize: 10),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                questendingDate!,
                style: GoogleFonts.poppins(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ],
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
                  submissionStatus!,
                  style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
                ),
              ),
            ],
          ),
        ));
  }
}
