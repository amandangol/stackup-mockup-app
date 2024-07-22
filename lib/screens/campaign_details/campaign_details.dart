import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/campaign_details/widgets/expansion_tile_widget.dart';
import 'package:stackup_app/screens/home_screen/models/campaigns_model.dart';

class CampaignDetails extends StatelessWidget {
  final Campaign? campaign;

  const CampaignDetails({super.key, this.campaign});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.surface,
          title: Text(
            "Campaign",
            style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  campaign!.image!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: Text(
                  campaign!.title!,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.inversePrimary),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: campaign!.hasDays!,
                  child: Row(
                    children: [
                      Text(
                        "Ends in",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  campaign!.endsInDay!,
                                  style: GoogleFonts.poppins(
                                      color: colorScheme.inversePrimary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "Days",
                                style: GoogleFonts.poppins(
                                    color: colorScheme.inversePrimary,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  campaign!.endsInMins!,
                                  style: GoogleFonts.poppins(
                                      color: colorScheme.inversePrimary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "Hours",
                                style: GoogleFonts.poppins(
                                    color: colorScheme.inversePrimary,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  campaign!.endsInMins!,
                                  style: GoogleFonts.poppins(
                                      color: colorScheme.inversePrimary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "Mins",
                                style: GoogleFonts.poppins(
                                    color: colorScheme.inversePrimary,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: colorScheme.secondary,
                indent: 10,
                endIndent: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "STATUS",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 209, 243, 210),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          campaign!.campaignStatus!,
                          style:
                              GoogleFonts.poppins(color: colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 2,
                    color: colorScheme.secondary,
                  ),
                  Column(
                    children: [
                      Text(
                        "QUESTS",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(border: Border.all()),
                            child: Icon(
                              Icons.code,
                              size: 15,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            campaign!.questCount!,
                            style: GoogleFonts.poppins(
                              color: colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 2,
                    color: colorScheme.secondary,
                  ),
                  Column(
                    children: [
                      Text(
                        "REWARD POOL",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.dollarSign,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            campaign!.rewardPool!,
                            style: GoogleFonts.poppins(
                              color: colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: colorScheme.secondary,
                indent: 10,
                endIndent: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "STARTS",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        campaign!.startDate!,
                        style: GoogleFonts.poppins(
                          color: colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 2,
                    color: colorScheme.secondary,
                  ),
                  Column(
                    children: [
                      Text(
                        "ENDS",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        campaign!.endDate!,
                        style: GoogleFonts.poppins(
                          color: colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: colorScheme.secondary,
                indent: 10,
                endIndent: 10,
              ),
              ExpansionTileWidget(
                title: "Description",
                description: campaign!.description,
              ),
              ExpansionTileWidget(
                title: "Learning Outcomes",
                description: campaign!.learningOutcomes,
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    "Quests",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.inversePrimary),
                  ),
                  children: campaign!.quests!.map((quest) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: colorScheme.inversePrimary),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: colorScheme.secondaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        "In Progress",
                                        style: GoogleFonts.poppins(
                                            color: colorScheme.inversePrimary),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 209, 243, 210),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        "Ongoing",
                                        style: GoogleFonts.poppins(
                                            color: colorScheme.primary),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "View Quest",
                                          style: GoogleFonts.poppins(
                                              color: colorScheme.inversePrimary,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.arrow_forward,
                                            color: colorScheme.inversePrimary),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  quest.title,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: colorScheme.inversePrimary),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.clock,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      quest.endDate,
                                      style: GoogleFonts.poppins(
                                          color: colorScheme.inversePrimary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.dollarSign,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      quest.reward,
                                      style: GoogleFonts.poppins(
                                          color: colorScheme.inversePrimary),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.user,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '${quest.players} Players',
                                      style: GoogleFonts.poppins(
                                          color: colorScheme.inversePrimary),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
