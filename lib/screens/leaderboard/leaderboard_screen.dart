import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stackup_app/screens/leaderboard/model/leaderboard_model.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<LeaderboardItem> leaderboardItems = [];
  bool isLoading = true;
  late LeaderboardItem currentUser;

  @override
  void initState() {
    super.initState();
    fetchLeaderboardData();
  }

  Future<void> fetchLeaderboardData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      leaderboardItems = LeaderboardModel.leaderboard();
      currentUser = LeaderboardModel.getCurrentUser();

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leaderboard',
          style: GoogleFonts.poppins(color: colorScheme.inversePrimary),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? Center(
              child: SpinKitCircle(
              color: colorScheme.primary,
            ))
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.deepPurple[100]!,
                    const Color.fromARGB(255, 249, 224, 224),
                  ],
                ),
              ),
              child: Column(
                children: [
                  _buildCurrentUserPosition(),
                  _buildTopThree(),
                  Expanded(
                    child: _buildLeaderboardList(),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTopThree() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildTopThreeItem(leaderboardItems[1], 2),
          _buildTopThreeItem(leaderboardItems[0], 1),
          _buildTopThreeItem(leaderboardItems[2], 3),
        ],
      ),
    );
  }

  Widget _buildCurrentUserPosition() {
    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Position',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  currentUser.name,
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '#${currentUser.rank}',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '${currentUser.score}',
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildTopThreeItem(LeaderboardItem item, int position) {
    double height = position == 1 ? 120 : 100;
    Color color = position == 1
        ? Colors.yellow
        : position == 2
            ? Colors.grey
            : const Color.fromARGB(255, 188, 66, 66);
    IconData icon = position == 1 ? Icons.emoji_events : Icons.emoji_events;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 40, color: color),
        SizedBox(height: 8),
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '#$position',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12),
              ),
              SizedBox(height: 4),
              Text(
                '${item.score}',
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardList() {
    return ListView.builder(
      itemCount: leaderboardItems.length - 3,
      itemBuilder: (context, index) {
        final item = leaderboardItems[index + 3];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              child: Text(
                '${item.rank}',
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(item.name),
            trailing: Text(
              '${item.score}',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
