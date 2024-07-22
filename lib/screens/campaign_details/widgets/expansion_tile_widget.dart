import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpansionTileWidget extends StatelessWidget {
  final String? title;
  final String? description;
  const ExpansionTileWidget({super.key, this.description, this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ExpansionTile(
      initiallyExpanded: false,
      title: Text(
        title!,
        style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colorScheme.inversePrimary),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description!,
                style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
