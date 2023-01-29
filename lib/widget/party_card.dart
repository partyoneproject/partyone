//PartyCard 하나
import 'package:flutter/material.dart';
import 'package:partyone/screens/party_detail.dart';
import 'package:partyone/widget/hash_tag.dart';

class PartyCard extends StatelessWidget {
  final partyName;
  final partyWhen;
  final partyWhere;
  final partyImage;

  const PartyCard(
      {super.key,
      required this.partyName,
      required this.partyWhen,
      required this.partyWhere,
      required this.partyImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PartyDetail(),
              fullscreenDialog: true,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //사진 이미지
              Container(
                height: 180,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image(
                  image: AssetImage("assets/images/$partyImage"),
                  fit: BoxFit.cover,
                ),
              ),

              Row(
                children: [
                  Text(
                    partyName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.people,
                    size: 12,
                  ),
                  Text(" 4/6"),
                ],
              ),
              Row(
                children: const [
                  HashTag(hashtag: "해시태그 1"),
                  HashTag(hashtag: "해시태그 2"),
                  HashTag(hashtag: "해시태그 3")
                ],
              )
            ],
          ),
        ));
  }
}
