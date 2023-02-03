import 'package:flutter/material.dart';

class HashTag extends StatelessWidget {
  final String hashtag;
  const HashTag({super.key, required this.hashtag});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(3)),
        margin: const EdgeInsets.only(right: 8.0, top: 2.0),
        padding: const EdgeInsets.all(3.0),
        child: Text(
          "#$hashtag",
          style: const TextStyle(fontSize: 9),
        ));
  }
}
