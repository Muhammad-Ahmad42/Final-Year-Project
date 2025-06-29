import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String userName;
  final String profileImage;

  const StoryCard({
    super.key,
    required this.userName,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10, right: 15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(profileImage),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            userName,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}