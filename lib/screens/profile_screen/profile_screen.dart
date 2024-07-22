import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.person_outlined),
          title: Text(
            "My Profile",
            style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildProfileInfo(),
              _buildExpertiseAreas(),
              _buildTechStacks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 237, 130, 85),
            Color.fromARGB(255, 241, 107, 107)
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Stackie123',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoItem('Nationality', 'Nepalese'),
          _buildInfoItem('Career Level', 'Entry Level'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseAreas() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expertise Areas',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChip('Mobile App Developer'),
              _buildChip('Web Frontend Developer'),
              _buildChip('Blockchain Developer'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechStacks() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tech Stacks',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChip('HTML'),
              _buildChip('CSS'),
              _buildChip('JavaScript'),
              _buildChip('React'),
              _buildChip('Dart'),
              _buildChip('Flutter')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      labelStyle: GoogleFonts.poppins(color: Colors.blue.shade900),
    );
  }
}
