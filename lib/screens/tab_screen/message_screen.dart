import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final friendlist = ['이상민', '신재현', '최성범', '박찬혁', '이수민'];
  final partylist = ['축구', '농구', '탁구', '술', '저녁', '양자역학', '전자기학'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "친구와 채팅하기",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          )),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.8),
              ),
            ),
            child: const Text(
              '친구 목록',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2 - 130,
              child: ListView(
                children: MakeListViewChildrenOfFriendList(friendlist, context),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.8),
                bottom: BorderSide(width: 0.8),
              ),
            ),
            child: const Text(
              '파티 목록',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          //리스트 뷰를 쓰려면 사이즈를 지정해야하는데, 꽉차게 만들라면 어떻게해야하지?
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2 - 130,
              child: ListView(
                children: MakeListViewChildrenOfPartyList(partylist, context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> MakeListViewChildrenOfFriendList(friendlist, context) {
  List<Widget> result = [];
  for (var i = 0; i < friendlist.length; i++) {
    result.add(
      Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.4),
          ),
        ),
        child: InkWell(
          onTap: () {
            print('avartar clicked');
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.green.shade400,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                friendlist[i],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return result;
}

List<Widget> MakeListViewChildrenOfPartyList(partylist, context) {
  List<Widget> result = [];
  for (var i = 0; i < partylist.length; i++) {
    result.add(
      Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.4),
          ),
        ),
        child: InkWell(
          onTap: () {
            print('party clicked');
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.green.shade400,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                partylist[i],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return result;
}
