import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/campaign_details/campaign_details.dart';
import 'package:stackup_app/screens/home_screen/models/campaigns_model.dart';
import 'package:stackup_app/screens/home_screen/widgets/campaign_card.dart';

class OngoingAndUpcomingCampaigns extends StatelessWidget {
  final Campaign? campaign;
  const OngoingAndUpcomingCampaigns({super.key, this.campaign});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      // backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Earn Campaigns',
          style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Earn as you expand your developer portfolio and build on the latest technologies through exciting quests",
                  style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Ongoing & Upcoming",
                style: GoogleFonts.poppins(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: campaigns.length,
              itemBuilder: (context, index) {
                final campaign = campaigns[index];
                return CampaignCard(
                  image: campaign.image!,
                  title: campaign.title!,
                  subTitle: campaign.subTitle!,
                  campaignStatus: campaign.campaignStatus!,
                  questCount: campaign.questCount!,
                  rewardPool: campaign.rewardPool!,
                  startDate: campaign.startDate!,
                  endDate: campaign.endDate!,
                  endsInDay: campaign.endsInDay!,
                  endsInHours: campaign.endsInHours!,
                  endsInMins: campaign.endsInMins!,
                  hasDays: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CampaignDetails(
                          campaign: campaign,
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
