//PartyCard 하나
import 'package:flutter/material.dart';
import 'package:partyone/party/screens/party_detail.dart';
import 'package:partyone/utils/widgets/hash_tag.dart';

class PartyCard extends StatelessWidget {
  final partyName;
  final partyWhen;
  final partyWhere;
  final partyImage;
  final view_direction;

  const PartyCard(
      {super.key,
      required this.partyName,
      required this.partyWhen,
      required this.partyWhere,
      required this.partyImage,
      required this.view_direction});

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
        child: view_direction == "horizontal"
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      children: const [
                        HashTag(hashtag: "해시태그 1"),
                        HashTag(hashtag: "해시태그 2"),
                        HashTag(hashtag: "해시태그 3")
                      ],
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //padding: const EdgeInsets.all(8.0),
                  children: [
                    //사진 이미지
                    Container(
                      width: MediaQuery.of(context).size.width / 2.4,
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

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              partyName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.where_to_vote_outlined,
                              size: 12,
                            ),
                            Text(
                              "신촌",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 12,
                            ),
                            Text(
                              "18:00-20:00",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.people,
                              size: 12,
                            ),
                            Text(
                              " 4/6",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          children: const [
                            HashTag(hashtag: "해시태그 1"),
                            HashTag(hashtag: "해시태그 2"),
                            HashTag(hashtag: "해시태그 3")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
