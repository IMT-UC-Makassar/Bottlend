import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  final int bottlePoint;
  final int bottleCollected;
  final List<Map<String, dynamic>> historyList;
  final Function() incrementPoints;
  final Function(int) decrementPoints;
  final Function(String, String, String) addHistory;

  const AppState({
    Key? key,
    required this.bottlePoint,
    required this.bottleCollected,
    required this.historyList,
    required this.incrementPoints,
    required this.decrementPoints,
    required this.addHistory,
    required Widget child,
  }) : super(key: key, child: child);

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>()!;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return bottlePoint != oldWidget.bottlePoint ||
        bottleCollected != oldWidget.bottleCollected ||
        historyList != oldWidget.historyList;
  }
}
