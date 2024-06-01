import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:bottlend_apps/app_state.dart';

class AchievementCard extends StatefulWidget {
  @override
  _AchievementCardState createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    int bottleDone = appState.bottleCollected;
    List<Map<String, dynamic>> achievements = appState.achievements;

    achievements.sort((a, b) {
      if (a['isClaimed'] && !b['isClaimed']) return 1;
      if (!a['isClaimed'] && b['isClaimed']) return -1;

      double percentA = bottleDone / a['bottleRemaining'];
      double percentB = bottleDone / b['bottleRemaining'];
      return percentB.compareTo(percentA);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Achievement',
            style: TextStyle(
                color: const Color(0xff189218), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              buildAchievementCard(
                achievements[index]['title'],
                bottleDone,
                achievements[index]['bottleRemaining'],
                achievements[index]['bonusPoints'],
                achievements[index]['isClaimed'],
                () {
                  setState(() {
                    achievements[index]['isClaimed'] = true;
                    appState
                        .claimAchievement(achievements[index]['bonusPoints']);
                    appState.markAchievementAsClaimed(index);

                    achievements.sort((a, b) {
                      if (a['isClaimed'] && !b['isClaimed']) return 1;
                      if (!a['isClaimed'] && b['isClaimed']) return -1;

                      double percentA = bottleDone / a['bottleRemaining'];
                      double percentB = bottleDone / b['bottleRemaining'];
                      return percentB.compareTo(percentA);
                    });
                  });

                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Success",
                    desc:
                        "You have successfully claimed ${achievements[index]['title']}!",
                    buttons: [
                      DialogButton(
                        color: const Color(0xff189218),
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {}); // Trigger UI update after dialog
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                },
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  int _limitedBottleDone(int bottleDone, int bottleRemaining) {
    return bottleDone > bottleRemaining ? bottleRemaining : bottleDone;
  }

  Widget buildAchievementCard(String title, int bottleDone, int bottleRemaining,
      int bonusPoints, bool isClaimed, VoidCallback onClaim) {
    bool isClaimable = bottleDone >= bottleRemaining && !isClaimed;
    int limitedBottleDone = _limitedBottleDone(bottleDone, bottleRemaining);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(24, 146, 24, 1)),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/assets/dailyq.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Reward: $bonusPoints Bottle Points',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: isClaimable ? onClaim : null,
                child: Text(isClaimed ? 'Claimed' : 'Claim'),
                style: ElevatedButton.styleFrom(
                  primary: isClaimable
                      ? const Color.fromRGBO(24, 146, 24, 1)
                      : Colors.grey,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            child: Text(
              '$limitedBottleDone of $bottleRemaining deliveries completed',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: limitedBottleDone / bottleRemaining,
            backgroundColor: Colors.grey[200],
            color: const Color.fromRGBO(24, 146, 24, 1),
          ),
        ],
      ),
    );
  }
}
