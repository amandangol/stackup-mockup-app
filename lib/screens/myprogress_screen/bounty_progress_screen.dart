import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/myprogress_screen/models/myprogress_questmodel.dart';
import 'package:stackup_app/screens/myprogress_screen/widgets/ongoin_quest_record_card.dart';
import 'package:stackup_app/screens/myprogress_screen/widgets/past_quest_card.dart';

class BountyProgressScreen extends StatefulWidget {
  const BountyProgressScreen({super.key});

  @override
  State<BountyProgressScreen> createState() => _BountyProgressScreenState();
}

class _BountyProgressScreenState extends State<BountyProgressScreen> {
  bool showOnGoingBounties = true;
  String? ongoingFilter;
  String? pastFilter;

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    showOnGoingBounties
                        ? "Ongoing Bounty Filters"
                        : "Past Bounty Filters",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: showOnGoingBounties
                        ? [
                            FilterChip(
                              label: Text(
                                "All",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: ongoingFilter == null,
                              onSelected: (bool selected) {
                                setState(() {
                                  ongoingFilter =
                                      selected ? null : ongoingFilter;
                                });
                                this.setState(() {});
                              },
                            ),
                            FilterChip(
                              label: Text(
                                "Submitted",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: ongoingFilter == "Submitted",
                              onSelected: (bool selected) {
                                setState(() {
                                  ongoingFilter = selected ? "Submitted" : null;
                                });
                                this.setState(() {});
                              },
                            ),
                            FilterChip(
                              label: Text(
                                "In Progress",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: ongoingFilter == "In Progress",
                              onSelected: (bool selected) {
                                setState(() {
                                  ongoingFilter =
                                      selected ? "In Progress" : null;
                                });
                                this.setState(() {});
                              },
                            ),
                          ]
                        : [
                            FilterChip(
                              label: Text(
                                "All",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: pastFilter == null,
                              onSelected: (bool selected) {
                                setState(() {
                                  pastFilter = selected ? null : pastFilter;
                                });
                                this.setState(() {});
                              },
                            ),
                            FilterChip(
                              label: Text(
                                "Rewarded",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: pastFilter == "Rewarded",
                              onSelected: (bool selected) {
                                setState(() {
                                  pastFilter = selected ? "Rewarded" : null;
                                });
                                this.setState(() {});
                              },
                            ),
                            FilterChip(
                              label: Text(
                                "Rejected",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: pastFilter == "Rejected",
                              onSelected: (bool selected) {
                                setState(() {
                                  pastFilter = selected ? "Rejected" : null;
                                });
                                this.setState(() {});
                              },
                            ),
                            FilterChip(
                              label: Text(
                                "Under Review",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: pastFilter == "Under Review",
                              onSelected: (bool selected) {
                                setState(() {
                                  pastFilter = selected ? "Under Review" : null;
                                });
                                this.setState(() {});
                              },
                            ),
                            FilterChip(
                              label: Text(
                                "Approved",
                                style: GoogleFonts.poppins(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              selected: pastFilter == "Approved",
                              onSelected: (bool selected) {
                                setState(() {
                                  pastFilter = selected ? "Approved" : null;
                                });
                                this.setState(() {});
                              },
                            ),
                          ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bounty Progress",
          style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.sliders),
            onPressed: () => _showFilterOptions(context),
          ),
        ],
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
                      border: showOnGoingBounties ? Border.all() : null,
                      borderRadius: BorderRadius.circular(10),
                      color: showOnGoingBounties
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
                            color: showOnGoingBounties
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: !showOnGoingBounties ? Border.all() : null,
                      borderRadius: BorderRadius.circular(10),
                      color: !showOnGoingBounties
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
                            color: !showOnGoingBounties
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              _buildBountyList(colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBountyList(ColorScheme colorScheme) {
    List<dynamic> filteredBounties = showOnGoingBounties
        ? ongoingFilter == null
            ? onGoingBountyRecords
            : onGoingBountyRecords
                .where((bounty) => bounty.submissionStatus == ongoingFilter)
                .toList()
        : pastFilter == null
            ? pastBounties.reversed.toList()
            : pastBounties
                .where((bounty) => bounty.rewardStatus == pastFilter)
                .toList()
                .reversed
                .toList();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredBounties.length,
      itemBuilder: (context, index) {
        if (showOnGoingBounties) {
          final ongoingBounty = filteredBounties[index];
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: OngoingQuestRecordsCard(
                colorScheme: colorScheme,
                questTitle: ongoingBounty.title,
                questendingDate: ongoingBounty.endDate,
                questStatus: ongoingBounty.status,
                submissionStatus: ongoingBounty.submissionStatus),
          );
        } else {
          final pastBounty = filteredBounties[index];
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
    );
  }
}
