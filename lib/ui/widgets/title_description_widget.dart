import 'package:flutter/material.dart';

class TitleDescriptionWidget extends StatelessWidget {
  final String title;

  const TitleDescriptionWidget({super.key, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 3,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],

    );
  }
}
