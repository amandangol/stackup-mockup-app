import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/config/routes/routes_name.dart';
import 'package:stackup_app/screens/campaign_details/campaign_details.dart';
import 'package:stackup_app/screens/home_screen/models/campaigns_model.dart';
import 'package:stackup_app/screens/home_screen/widgets/campaign_card.dart';
import 'package:stackup_app/screens/home_screen/widgets/my_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Welcome, theodore"),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTileCard(
                expandedColor: colorScheme.secondary,
                expandedTextColor: colorScheme.inversePrimary,
                initiallyExpanded: true,
                leading: Icon(Icons.speaker_phone),
                title: Text(
                  "New: Monthly Happenings Calender",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.inversePrimary,
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                                color: colorScheme.inversePrimary),
                            children: [
                              const TextSpan(
                                text:
                                    "Want to find out what is upcoming at a glance? You now have a home to visit! Visit our ",
                              ),
                              TextSpan(
                                text: "Monthly Happenings Calendar",
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 192, 67, 58),
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(
                                        'https://stackuphq.notion.site/Monthly-Happenings-ae7b7a4033f44ea2949e98c5e6604387');
                                  },
                              ),
                              const TextSpan(
                                text:
                                    " to view all upcoming quests, bounties, events and challenges.",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Jul 04, 2024",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Campaigns",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.ongoingScreen);
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: campaigns.length,
                itemBuilder: (context, index) {
                  print(campaigns.length);
                  print(campaigns[index].title);
                  print(campaigns[index].toString());
                  final campaign = campaigns[index];
                  return CampaignCard(
                    image: campaign.image,
                    title: campaign.title,
                    subTitle: campaign.subTitle,
                    campaignStatus: campaign.campaignStatus,
                    questCount: campaign.questCount,
                    rewardPool: campaign.rewardPool,
                    startDate: campaign.startDate,
                    endDate: campaign.endDate,
                    endsInDay: campaign.endsInDay,
                    endsInHours: campaign.endsInHours,
                    endsInMins: campaign.endsInMins,
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ended",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: GoogleFonts.poppins(
                            color: colorScheme.inversePrimary),
                      ),
                    ),
                  ],
                ),
              ),
              CampaignCard(
                image: "images/flask_campaign.png",
                title: "Developing Web Applications with Flask",
                subTitle: "",
                campaignStatus: "Past",
                rewardPool: "\$2950",
                questCount: "3",
                startDate: "Jun 28, 2024, 12:00",
                endDate: "Jul 14, 2024, 12:00",
                endsInDay: "",
                endsInHours: "",
                endsInMins: "",
                hasDays: false,
              ),
              CampaignCard(
                image: "images/threejs_campaign.png",
                title: "3D Web Design with ThreeJS",
                subTitle: "",
                campaignStatus: "Past",
                rewardPool: "Mixed",
                questCount: "3",
                startDate: "Jun 21, 2024, 12:00",
                endDate: "Jul 7, 2024, 12:00",
                endsInDay: "",
                endsInHours: "",
                endsInMins: "",
                hasDays: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
