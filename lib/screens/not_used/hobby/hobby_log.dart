import 'package:flutter/material.dart';
import 'package:partyone/widget/hash_tag.dart';

class HobbyLog extends StatelessWidget {
  const HobbyLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () => print('가입 클릭'),
              child: Container(
                margin: const EdgeInsets.only(right: 24),
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade300,
                ),
                child: const Text(
                  '가입',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: ListView(
          children: const [
            LogCard(),
            LogCard(),
          ],
        ));
  }
}

class LogCard extends StatelessWidget {
  const LogCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: const SizedBox(
                height: 36,
                width: 36,
                child: Image(
                  image: AssetImage("assets/images/profile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "박찬혁",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    "2023.00.00",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Image(
              image: AssetImage("assets/images/log.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            HashTag(hashtag: "해시태그 1"),
            HashTag(hashtag: "해시태그 2"),
            HashTag(hashtag: "해시태그 3")
          ],
        )
      ]),
    );
  }
}
