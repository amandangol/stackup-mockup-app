import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlanceCard extends StatelessWidget {
  final IconData? icon;
  final String? number;
  final String? text;
  const GlanceCard({super.key, this.icon, this.number, this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 234, 238),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number!,
                style: GoogleFonts.poppins(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                text!,
                style: GoogleFonts.poppins(
                    color: colorScheme.primary, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
