import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/myprogress_screen/models/myprogress_questmodel.dart';
import 'package:stackup_app/screens/myprogress_screen/widgets/glance_card.dart';
import 'package:stackup_app/screens/myprogress_screen/widgets/ongoin_quest_record_card.dart';
import 'package:stackup_app/screens/myprogress_screen/widgets/past_quest_card.dart';

class MyprogressScreen extends StatefulWidget {
  const MyprogressScreen({super.key});

  @override
  State<MyprogressScreen> createState() => _MyprogressScreenState();
}

class _MyprogressScreenState extends State<MyprogressScreen> {
  bool showOngoingQuests = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // List<PastQuestRecord> sortedPastQuests = List.from(pastQuests)
    //   ..sort((a, b) => b.title.compareTo(a.title));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.leak_remove_outlined),
            onPressed: () {
              // Open drawer
            }),
        backgroundColor: Colors.transparent,
        title: Text(
          "My Progress",
          style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Know where you are, what you've accomplished, and what's next at a glance!",
                  style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "At a Glance",
                style: GoogleFonts.poppins(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ListView(
                  shrinkWrap: true,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: , // Number of columns
                  //   // crossAxisSpacing: 10.0,
                  //   // mainAxisSpacing: 10.0,
                  //   // childAspectRatio: 2 / 4, // Aspect ratio of each item
                  // ),
                  children: const [
                    GlanceCard(
                      icon: Icons.code,
                      number: "4",
                      text: "Submissions Due",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GlanceCard(
                      icon: Icons.notes,
                      number: "100",
                      text: "Submitted",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GlanceCard(
                      icon: Icons.emoji_emotions_outlined,
                      number: "90",
                      text: "Rewarded",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GlanceCard(
                      icon: Icons.code,
                      number: "299\$",
                      text: "Total Quests Earning",
                    ),
                  ],
                ),
              ),
              Text(
                "Quest Records",
                style: GoogleFonts.poppins(
                    color: colorScheme.inversePrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: showOngoingQuests ? Border.all() : null,
                      borderRadius: BorderRadius.circular(10),
                      color: showOngoingQuests
                          ? colorScheme.secondary
                          : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showOngoingQuests = true;
                        });
                      },
                      child: Text(
                        "Ongoing",
                        style: GoogleFonts.poppins(
                            color: showOngoingQuests
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: !showOngoingQuests ? Border.all() : null,
                      borderRadius: BorderRadius.circular(10),
                      color: !showOngoingQuests
                          ? colorScheme.secondary
                          : Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showOngoingQuests = false;
                        });
                      },
                      child: Text(
                        "Past",
                        style: GoogleFonts.poppins(
                            color: !showOngoingQuests
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
                itemCount: showOngoingQuests
                    ? onGoingquestRecords.length
                    : pastQuests.length,
                itemBuilder: (context, index) {
                  if (showOngoingQuests) {
                    final ongoingQuest = onGoingquestRecords[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: OngoingQuestRecordsCard(
                          colorScheme: colorScheme,
                          questTitle: ongoingQuest.title,
                          questendingDate: ongoingQuest.endDate,
                          questStatus: ongoingQuest.status,
                          submissionStatus: ongoingQuest.submissionStatus),
                    );
                  } else {
                    List<PastQuestRecord> reversedPastQuests =
                        List.from(pastQuests.reversed);
                    final pastQuest = reversedPastQuests[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: PastQuestCard(
                          questTitle: pastQuest.title,
                          reward: pastQuest.reward,
                          questStatus: pastQuest.status,
                          rewardStatus: pastQuest.rewardStatus),
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
