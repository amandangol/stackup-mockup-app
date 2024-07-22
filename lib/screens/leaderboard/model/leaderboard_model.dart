class LeaderboardItem {
  final String name;
  final int rank;
  final int score;
  final bool isCurrentUser;

  LeaderboardItem(this.name, this.rank, this.score,
      {this.isCurrentUser = false});
}

class LeaderboardModel {
  static List<LeaderboardItem> leaderboard() {
    return [
      LeaderboardItem('Stackie1', 1, 10000),
      LeaderboardItem('Stackie2', 2, 9500),
      LeaderboardItem('Stackie3', 3, 9000),
      LeaderboardItem('Alice Brown', 4, 8500),
      LeaderboardItem('Charlie Davis', 5, 8000),
      LeaderboardItem('Eva Wilson', 6, 7500),
      LeaderboardItem('Frank Miller', 7, 7000),
      LeaderboardItem('Grace Lee', 8, 6500),
      LeaderboardItem('Henry Taylor', 9, 6000),
      LeaderboardItem('Ivy Clark', 10, 5500),
      // Add the current user here
      LeaderboardItem('Stackie123', 15, 4000, isCurrentUser: true),
    ];
  }

  static LeaderboardItem getCurrentUser() {
    return leaderboard().firstWhere((item) => item.isCurrentUser,
        orElse: () => LeaderboardItem('Stackie123', 0, 0, isCurrentUser: true));
  }
}
