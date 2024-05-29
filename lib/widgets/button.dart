import 'package:bottlend_apps/pages/homepage.dart';
import 'package:flutter/material.dart';

class ButtonList extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  ButtonList({
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(6.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Image.asset(
              imagePath,
              width: 38,
              height: 49,
            ),
          ),
        ),
      ],
    );
  }
}
