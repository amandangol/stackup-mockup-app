import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CampaignCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? rewardPool;
  final String? questCount;
  final String? startDate;
  final String? endDate;
  final String? endsInDay;
  final String? endsInHours;
  final String? endsInMins;
  final String? campaignStatus;
  final String? image;
  final VoidCallback? onTap;
  bool? hasDays;
  // final Campaign? campaign;

  CampaignCard({
    super.key,
    this.title,
    this.subTitle,
    this.rewardPool,
    this.questCount,
    this.startDate,
    this.endDate,
    this.endsInDay,
    this.endsInHours,
    this.endsInMins,
    this.campaignStatus,
    this.hasDays,
    this.onTap,
    this.image,
  });

  // bool? hasDays = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            child: Image.asset(
              image!,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              contentPadding: const EdgeInsets.all(8),
              tileColor: colorScheme.secondary,
              title: Text(
                title!,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 209, 243, 210),
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  campaignStatus!,
                  style: GoogleFonts.poppins(color: colorScheme.primary),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subTitle!,
                    style: GoogleFonts.poppins(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${rewardPool!} Reward Pool",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${questCount!} Quests",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Start",
                            style: GoogleFonts.poppins(
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            startDate!,
                            style: GoogleFonts.poppins(
                              color: colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "End",
                            style: GoogleFonts.poppins(
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            endDate!,
                            style: GoogleFonts.poppins(
                              color: colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: hasDays! ? true : false,
                    child: Text(
                      "Ends in",
                      style: GoogleFonts.poppins(color: colorScheme.primary),
                    ),
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
                              endsInDay!,
                              style: GoogleFonts.poppins(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Visibility(
                            visible: hasDays! ? true : false,
                            child: Text(
                              "Days",
                              style: GoogleFonts.poppins(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.normal),
                            ),
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
                              endsInHours!,
                              style: GoogleFonts.poppins(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Visibility(
                            visible: hasDays! ? true : false,
                            child: Text(
                              "Hours",
                              style: GoogleFonts.poppins(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.normal),
                            ),
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
                              endsInMins!,
                              style: GoogleFonts.poppins(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Visibility(
                            visible: hasDays! ? true : false,
                            child: Text(
                              "Mins",
                              style: GoogleFonts.poppins(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.normal),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
