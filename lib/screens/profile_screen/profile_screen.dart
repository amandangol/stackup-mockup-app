import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stackup_app/screens/authscreens/provider/userprovider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _nationalityController;
  late TextEditingController _careerLevelController;
  List<String> expertiseAreas = [
    'Mobile App Developer',
    'Web Frontend Developer',
    'Blockchain Developer'
  ];
  List<String> techStacks = [
    'HTML',
    'CSS',
    'JavaScript',
    'React',
    'Dart',
    'Flutter'
  ];
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _nationalityController = TextEditingController(text: 'Nepalese');
    _careerLevelController = TextEditingController(text: 'Entry Level');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _nationalityController.dispose();
    _careerLevelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(colorScheme),
          SliverToBoxAdapter(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: colorScheme.secondary),
              child: Column(
                children: [
                  _buildProfileInfo(colorScheme),
                  _buildExpertiseAreas(colorScheme),
                  _buildTechStacks(colorScheme),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isEditing = !_isEditing;
            if (!_isEditing) {
              // Save changes here
              // You might want to update your UserProvider here
            }
          });
        },
        child: Icon(_isEditing ? Icons.save : Icons.edit),
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
      ),
    );
  }

  Widget _buildSliverAppBar(ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Consumer<UserProvider>(
          builder: (context, user, child) {
            _usernameController.text = user.username ?? "Stackie123";
            return _isEditing
                ? SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _usernameController,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimary,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  )
                : Text(
                    _usernameController.text,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimary,
                    ),
                  );
          },
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    colorScheme.primary.withOpacity(0.7)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(ColorScheme colorScheme) {
    return Card(
      margin: EdgeInsets.all(16),
      color: colorScheme.secondary,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            _buildInfoItem('Nationality', _nationalityController, colorScheme),
            _buildInfoItem('Career Level', _careerLevelController, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
      String label, TextEditingController controller, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: _isEditing
                ? TextField(
                    controller: controller,
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: colorScheme.onSurface),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                  )
                : Text(
                    controller.text,
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: colorScheme.onSurface),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpertiseAreas(ColorScheme colorScheme) {
    return Card(
      margin: EdgeInsets.all(16),
      color: colorScheme.secondary,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expertise Areas',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...expertiseAreas.map((area) => _buildChip(area, colorScheme)),
                if (_isEditing)
                  ActionChip(
                    label: Icon(Icons.add, color: colorScheme.onPrimary),
                    backgroundColor: colorScheme.primary,
                    onPressed: () => _addNewItem(expertiseAreas),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechStacks(ColorScheme colorScheme) {
    return Card(
      margin: EdgeInsets.all(16),
      color: colorScheme.secondary,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tech Stacks',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...techStacks.map((tech) => _buildChip(tech, colorScheme)),
                if (_isEditing)
                  ActionChip(
                    label: Icon(Icons.add, color: colorScheme.onPrimary),
                    backgroundColor: colorScheme.primary,
                    onPressed: () => _addNewItem(techStacks),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, ColorScheme colorScheme) {
    return InputChip(
      label: Text(label),
      backgroundColor: colorScheme.primaryContainer,
      labelStyle: GoogleFonts.poppins(color: colorScheme.inversePrimary),
      onDeleted: _isEditing
          ? () {
              setState(() {
                expertiseAreas.remove(label);
                techStacks.remove(label);
              });
            }
          : null,
      deleteIconColor: colorScheme.onPrimaryContainer,
    );
  }

  void _addNewItem(List<String> list) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newItem = '';
        final colorScheme = Theme.of(context).colorScheme;
        return AlertDialog(
          title: Text('Add New Item',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: colorScheme.primary)),
          content: TextField(
            onChanged: (value) {
              newItem = value;
            },
            decoration: InputDecoration(hintText: "Enter new item"),
            style: GoogleFonts.poppins(color: colorScheme.onSurface),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add',
                  style: GoogleFonts.poppins(color: colorScheme.primary)),
              onPressed: () {
                setState(() {
                  if (newItem.isNotEmpty) {
                    list.add(newItem);
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
