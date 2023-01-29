import 'package:flutter/material.dart';
import 'package:partyone/widget/hash_tag.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              SizedBox(
                height: 200.0,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/backgroundimg.jpg'))),
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
              //탭
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: TabBar(
                        tabs: [
                          Container(
                            height: 32,
                            alignment: Alignment.center,
                            child: const Text(
                              '모든 파티',
                            ),
                          ),
                          Container(
                            height: 32,
                            alignment: Alignment.center,
                            child: const Text(
                              '파티장',
                            ),
                          ),
                          Container(
                            height: 32,
                            alignment: Alignment.center,
                            child: const Text(
                              '파티원',
                            ),
                          ),
                        ],
                        indicator: const BoxDecoration(
                          gradient: LinearGradient(
                            //배경 그라데이션 적용
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.blueAccent,
                              Colors.greenAccent,
                            ],
                          ),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        controller: _tabController,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Tab1 View',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Tab2 View',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Tab3 View',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
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
                  IconButton(onPressed: () => {}, icon: const Icon(Icons.edit)),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => {},
                  )
                ],
              ))
        ],
      ),
    );
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
