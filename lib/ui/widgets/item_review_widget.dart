import 'package:flutter/material.dart';

class ItemReviewWidget extends StatelessWidget{
  const ItemReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      textColor: Colors.white,
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      childrenPadding: EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(
        "Review 1",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      children: [
        Text(
          "No hay nadie que ame el dolor mismo, que lo busque, lo encuentre y lo quiera, simplemente porque es el dolor",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
