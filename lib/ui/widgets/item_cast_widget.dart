import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget{

  final String avatarImage;
  final String nameActor;
  final String nameCharacter;

  const ItemCastWidget({super.key, 
    required this.avatarImage,
    required this.nameActor,
    required this.nameCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12.0),
      width: 120,
      child: Column(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(
              "https://image.tmdb.org/t/p/w500$avatarImage",
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            nameActor,
            maxLines: 2,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            nameCharacter,
            maxLines: 2,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
