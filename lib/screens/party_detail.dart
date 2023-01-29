import 'package:flutter/material.dart';
import 'package:partyone/screens/announcement.dart';
import 'package:partyone/screens/member_preview.dart';
import 'package:partyone/widget/share.dart';

class PartyDetail extends StatelessWidget {
  const PartyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              shareKakao();
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.heart_broken),
          ),
        ],
        title: const Text('축구'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 8 / 33,
              child: const Image(
                image: AssetImage('assets/images/soccer.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.2),
                ),
              ),
              child: const Text(
                "축구 용병 2명 구합니다",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_month),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "토요일, 2월 4, 2023",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "오후 2:00 - 오후 5:00",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.where_to_vote_rounded),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Yonsei University",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "서울특별시 서대문구 연세로 50",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("주최"),
                        const SizedBox(
                          height: 5,
                        ),
                        partyCaptinProfile(),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MemberPreview(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("참석"),
                        const SizedBox(
                          height: 5,
                        ),
                        partyOneProfiles(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Announcement()));
              },
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.2),
                  ),
                ),
                child: Row(
                  children: const [
                    Text(
                      '공지사항',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

CircleAvatar partyCaptinProfile() {
  return CircleAvatar(
    backgroundColor: Colors.green.shade400,
    radius: 16,
  );
}

Stack partyOneProfiles() {
  return Stack(
    children: partyOneProfile(5),
  );
}

List<Widget> partyOneProfile(int count) {
  List<Widget> result = [];

  for (var i = 0; i < count; i++) {
    result.add(
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: i * 20.toDouble(),
            ),
            CircleAvatar(
              backgroundColor:
                  Colors.green.withOpacity((i + 2) / 10.toDouble()),
              radius: 16,
            ),
          ],
        ),
      ),
    );
  }
  return result;
}
