import 'package:flutter/material.dart';

class LikesImages extends StatelessWidget {
  final List<String> likeImagesList;

  const LikesImages({
    super.key,
    required this.likeImagesList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          for (int index = 0; index < likeImagesList.length; index++)
            Positioned(
              left: 26.0 * index,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(likeImagesList[index]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}