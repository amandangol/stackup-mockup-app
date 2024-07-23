import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/campaign_details/widgets/expansion_tile_widget.dart';
import 'package:stackup_app/screens/home_screen/models/campaigns_model.dart';

class CampaignDetails extends StatelessWidget {
  final Campaign campaign;

  const CampaignDetails({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        title: Text("Campaign",
            style: textTheme.titleLarge
                ?.copyWith(color: colorScheme.inversePrimary)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(campaign.image!,
                width: double.infinity, fit: BoxFit.cover),
            _buildTitleSection(textTheme, colorScheme),
            if (campaign.hasDays!)
              _buildCountdownSection(textTheme, colorScheme),
            _buildDivider(colorScheme),
            _buildInfoSection(textTheme, colorScheme),
            _buildDivider(colorScheme),
            _buildDateSection(textTheme, colorScheme),
            _buildDivider(colorScheme),
            ExpansionTileWidget(
                title: "Description", description: campaign.description),
            ExpansionTileWidget(
                title: "Learning Outcomes",
                description: campaign.learningOutcomes),
            _buildQuestsSection(textTheme, colorScheme, context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection(TextTheme textTheme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: Text(campaign.title!,
          style: textTheme.titleMedium
              ?.copyWith(color: colorScheme.inversePrimary)),
    );
  }

  Widget _buildCountdownSection(TextTheme textTheme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text("Ends in",
              style: textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.inversePrimary)),
          const SizedBox(width: 10),
          _buildCountdownUnit(
              "Days", campaign.endsInDay!, textTheme, colorScheme),
          _buildCountdownUnit(
              "Hours", campaign.endsInMins!, textTheme, colorScheme),
          _buildCountdownUnit(
              "Mins", campaign.endsInMins!, textTheme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildCountdownUnit(String label, String value, TextTheme textTheme,
      ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(value,
                style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold)),
          ),
          Text(label,
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.inversePrimary)),
        ],
      ),
    );
  }

  Widget _buildInfoSection(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInfoItem(
            "STATUS", campaign.campaignStatus!, textTheme, colorScheme,
            isStatus: true),
        _buildVerticalDivider(colorScheme),
        _buildInfoItem("QUESTS", campaign.questCount!, textTheme, colorScheme,
            icon: Icons.code),
        _buildVerticalDivider(colorScheme),
        _buildInfoItem(
            "REWARD POOL", campaign.rewardPool!, textTheme, colorScheme,
            icon: FontAwesomeIcons.dollarSign),
      ],
    );
  }

  Widget _buildInfoItem(
      String label, String value, TextTheme textTheme, ColorScheme colorScheme,
      {bool isStatus = false, IconData? icon}) {
    return Column(
      children: [
        Text(label,
            style: textTheme.bodyMedium
                ?.copyWith(color: colorScheme.inversePrimary)),
        const SizedBox(height: 5),
        if (isStatus)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 243, 210),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(value,
                style:
                    textTheme.bodyMedium?.copyWith(color: colorScheme.primary)),
          )
        else
          Row(
            children: [
              if (icon != null)
                Icon(icon, size: 15, color: colorScheme.primary),
              if (icon != null) const SizedBox(width: 5),
              Text(value,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: colorScheme.inversePrimary)),
            ],
          ),
      ],
    );
  }

  Widget _buildDateSection(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildDateItem("STARTS", campaign.startDate!, textTheme, colorScheme),
        _buildVerticalDivider(colorScheme),
        _buildDateItem("ENDS", campaign.endDate!, textTheme, colorScheme),
      ],
    );
  }

  Widget _buildDateItem(
      String label, String date, TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      children: [
        Text(label,
            style: textTheme.bodyMedium
                ?.copyWith(color: colorScheme.inversePrimary)),
        const SizedBox(height: 5),
        Text(date,
            style: textTheme.bodyMedium
                ?.copyWith(color: colorScheme.inversePrimary)),
      ],
    );
  }

  Widget _buildQuestsSection(
      TextTheme textTheme, ColorScheme colorScheme, BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text("Quests",
            style: textTheme.titleMedium?.copyWith(
                color: colorScheme.inversePrimary,
                fontWeight: FontWeight.bold)),
        children: campaign.quests!
            .map((quest) => _buildQuestItem(quest, textTheme, colorScheme))
            .toList(),
      ),
    );
  }

  Widget _buildQuestItem(
      Quest quest, TextTheme textTheme, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.inversePrimary),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestHeader(textTheme, colorScheme),
            const SizedBox(height: 15),
            Text(quest.title,
                style: textTheme.titleSmall
                    ?.copyWith(color: colorScheme.inversePrimary)),
            const SizedBox(height: 5),
            _buildQuestInfo(
                FontAwesomeIcons.clock, quest.endDate, textTheme, colorScheme),
            _buildQuestInfo(FontAwesomeIcons.dollarSign, quest.reward,
                textTheme, colorScheme),
            _buildQuestInfo(FontAwesomeIcons.user, '${quest.players} Players',
                textTheme, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestHeader(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      children: [
        _buildStatusChip("In Progress", colorScheme.secondaryContainer,
            textTheme, colorScheme),
        const SizedBox(width: 10),
        _buildStatusChip("Ongoing", const Color.fromARGB(255, 209, 243, 210),
            textTheme, colorScheme,
            textColor: colorScheme.primary),
        const Spacer(),
        Text("View Quest",
            style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.inversePrimary,
                fontWeight: FontWeight.w500)),
        const SizedBox(width: 5),
        Icon(Icons.arrow_forward, color: colorScheme.inversePrimary),
      ],
    );
  }

  Widget _buildStatusChip(
      String label, Color color, TextTheme textTheme, ColorScheme colorScheme,
      {Color? textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Text(label,
          style: textTheme.bodySmall
              ?.copyWith(color: textColor ?? colorScheme.inversePrimary)),
    );
  }

  Widget _buildQuestInfo(IconData icon, String text, TextTheme textTheme,
      ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          FaIcon(icon, size: 16),
          const SizedBox(width: 5),
          Text(text,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.inversePrimary,
              )),
        ],
      ),
    );
  }

  Widget _buildDivider(ColorScheme colorScheme) {
    return Divider(color: colorScheme.secondary, indent: 10, endIndent: 10);
  }

  Widget _buildVerticalDivider(ColorScheme colorScheme) {
    return Container(height: 70, width: 2, color: colorScheme.secondary);
  }
}
