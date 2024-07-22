import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/myprogress_screen/models/myprogress_questmodel.dart';
import 'package:stackup_app/screens/myprogress_screen/widgets/ongoin_quest_record_card.dart';
import 'package:stackup_app/screens/myprogress_screen/widgets/past_quest_card.dart';

class BountyProgressScreen extends StatefulWidget {
  const BountyProgressScreen({super.key});

  @override
  State<BountyProgressScreen> createState() => _BountyProgressScreenState();
}

bool? showOnGoingBounties = true;

class _BountyProgressScreenState extends State<BountyProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bounty Progress",
          style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: showOnGoingBounties! ? Border.all() : null,
                      borderRadius: BorderRadius.circular(10),
                      color: showOnGoingBounties!
                          ? colorScheme.secondary
                          : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showOnGoingBounties = true;
                        });
                      },
                      child: Text(
                        "Ongoing",
                        style: GoogleFonts.poppins(
                            color: showOnGoingBounties!
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: !showOnGoingBounties! ? Border.all() : null,
                      borderRadius: BorderRadius.circular(10),
                      color: !showOnGoingBounties!
                          ? colorScheme.secondary
                          : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showOnGoingBounties = false;
                        });
                      },
                      child: Text(
                        "Past",
                        style: GoogleFonts.poppins(
                            color: !showOnGoingBounties!
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                // padding: EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: showOnGoingBounties!
                    ? onGoingBountyRecords.length
                    : pastBounties.length,
                itemBuilder: (context, index) {
                  if (showOnGoingBounties!) {
                    final ongoingBounties = onGoingBountyRecords[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: OngoingQuestRecordsCard(
                          colorScheme: colorScheme,
                          questTitle: ongoingBounties.title,
                          questendingDate: ongoingBounties.endDate,
                          questStatus: ongoingBounties.status,
                          submissionStatus: ongoingBounties.submissionStatus),
                    );
                  } else {
                    List<PastBountyRecord> reversedPastBounties =
                        pastBounties.reversed.toList();
                    final pastBounty = reversedPastBounties[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: PastQuestCard(
                          questTitle: pastBounty.title,
                          reward: pastBounty.reward,
                          questStatus: pastBounty.status,
                          rewardStatus: pastBounty.rewardStatus),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
