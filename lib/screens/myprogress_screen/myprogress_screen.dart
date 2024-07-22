import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/myprogress_screen/bounty_progress_screen.dart';
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
  late Future<void> _dataLoadingFuture;

  @override
  void initState() {
    super.initState();
    _dataLoadingFuture = _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "My Progress",
          style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
        ),
      ),
      body: FutureBuilder(
        future: _dataLoadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitCircle(
                color: colorScheme.primary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return _buildContent(colorScheme);
          }
        },
      ),
    );
  }

  Widget _buildContent(ColorScheme colorScheme) {
    return Padding(
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
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            _buildAtAGlanceSection(colorScheme),
            const SizedBox(height: 10),
            _buildQuestRecordsSection(colorScheme),
            const SizedBox(height: 15),
            _buildQuestToggleButtons(colorScheme),
            const SizedBox(height: 5),
            _buildQuestList(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildAtAGlanceSection(ColorScheme colorScheme) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: const Icon(Icons.visibility),
        title: Text(
          "At a Glance",
          style: GoogleFonts.poppins(
              color: colorScheme.inversePrimary, fontWeight: FontWeight.w500),
        ),
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: const [
              GlanceCard(
                icon: Icons.code_off_outlined,
                number: "4",
                text: "Submissions Due",
              ),
              SizedBox(height: 5),
              GlanceCard(
                icon: Icons.check_box_outlined,
                number: "100",
                text: "Submitted",
              ),
              SizedBox(height: 5),
              GlanceCard(
                icon: Icons.emoji_emotions_outlined,
                number: "90",
                text: "Rewarded",
              ),
              SizedBox(height: 5),
              GlanceCard(
                icon: Icons.star_border,
                number: "299\$",
                text: "Total Quests Earning",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestRecordsSection(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Quest Records",
          style: GoogleFonts.poppins(
              color: colorScheme.inversePrimary,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BountyProgressScreen()));
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: colorScheme.secondary),
            child: Row(
              children: [
                Text(
                  "Show Bounties Records",
                  style: GoogleFonts.poppins(
                      color: colorScheme.inversePrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: colorScheme.inversePrimary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestToggleButtons(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: showOngoingQuests ? Border.all() : null,
            borderRadius: BorderRadius.circular(10),
            color:
                showOngoingQuests ? colorScheme.secondary : Colors.transparent,
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
            color:
                !showOngoingQuests ? colorScheme.secondary : Colors.transparent,
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
    );
  }

  Widget _buildQuestList(ColorScheme colorScheme) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          showOngoingQuests ? onGoingquestRecords.length : pastQuests.length,
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
    );
  }
}
