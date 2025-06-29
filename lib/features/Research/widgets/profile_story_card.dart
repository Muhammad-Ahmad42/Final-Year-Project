import 'package:flutter/material.dart';

class ProfileStoryCard extends StatelessWidget {
  const ProfileStoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 8, bottom: 10),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 4),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/p1.jpeg'),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Colors.white,
              ),
              child: const Icon(Icons.add_circle, color: Colors.orange, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}