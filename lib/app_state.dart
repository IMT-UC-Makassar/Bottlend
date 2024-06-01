import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  int bottlePoint;
  final int bottleCollected;
  final List<Map<String, dynamic>> historyList;
  final List<Map<String, dynamic>> achievements;
  final Function() incrementPoints;
  final Function(int) decrementPoints;
  final Function(String, String, String) addHistory;
  final Function(int) claimAchievement;
  final Function(int) markAchievementAsClaimed;

  AppState({
    Key? key,
    required this.bottlePoint,
    required this.bottleCollected,
    required this.historyList,
    required this.achievements,
    required this.incrementPoints,
    required this.decrementPoints,
    required this.addHistory,
    required this.claimAchievement,
    required this.markAchievementAsClaimed,
    required Widget child,
  }) : super(key: key, child: child);

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>()!;
  }

  bool hasClaimableAchievements() {
    return achievements.any((achievement) =>
        !achievement['isClaimed'] &&
        bottleCollected >= achievement['bottleRemaining']);
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return bottlePoint != oldWidget.bottlePoint ||
        bottleCollected != oldWidget.bottleCollected ||
        historyList != oldWidget.historyList ||
        achievements != oldWidget.achievements;
  }
}
