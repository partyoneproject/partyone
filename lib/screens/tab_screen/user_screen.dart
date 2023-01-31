import 'package:flutter/material.dart';
import 'package:partyone/widget/hash_tag.dart';
import 'package:partyone/widget/party_card.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<Map> data = [
    {"Where": "신촌", "When": "10.27", "Name": "축구", "img": "soccer.jpg"},
    {"Where": "연희동", "When": "01.17", "Name": "밥먹을 사람~", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // background image and bottom contents
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/backgroundimg.jpg'))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "뷔",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      "안녕하세요 저는 BTS 뷔 입니다.",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: const [
                        HashTag(hashtag: "개발"),
                        HashTag(hashtag: "백엔드"),
                        HashTag(hashtag: "인공지능"),
                        HashTag(hashtag: "술"),
                        HashTag(hashtag: "INTP"),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "관심사",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: const [
                            Chip(
                                label: Text("카테고리1"),
                                labelPadding: EdgeInsets.all(2.0)),
                            Chip(
                                label: Text("카테고리2"),
                                labelPadding: EdgeInsets.all(2.0)),
                            Chip(
                                label: Text("카테고리 3"),
                                labelPadding: EdgeInsets.all(2.0))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),

            // Profile image
            Positioned(
              top: 150.0,
              left: 10.0, // (background container size) - (circle height / 2)
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(
                    image: AssetImage("assets/images/profile.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // 설정 및 편집 버튼
            Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  title: const Text(""),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  actions: [
                    IconButton(
                        onPressed: () => {}, icon: const Icon(Icons.edit)),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => {},
                    )
                  ],
                ))
          ],
        ),
      ],
    ));
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "박찬혁",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const Text(
            "I'm  an  ACE",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Row(
            children: const [
              HashTag(hashtag: "개발"),
              HashTag(hashtag: "백엔드"),
              HashTag(hashtag: "인공지능"),
              HashTag(hashtag: "술"),
              HashTag(hashtag: "INTP"),
            ],
          ),
          Row(
            children: const [
              Text(
                "연세대학교/ 전기전자공학부",
                style: TextStyle(color: Colors.black38),
              )
            ],
          )
        ],
      ),
    );
  }
}
