import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final friendlist = [
    '이상민',
    '신재현',
    '최성범',
    '박찬혁',
    '이수민',
    '노무현',
    '이명박',
    '박근혜',
    '문재인',
    '윤석열'
  ];
  final partylist = [
    '축구',
    '농구',
    '탁구',
    '술',
    '저녁',
    '양자역학',
    '전자기학',
    '고체물리학',
    '반도체 소자물리'
  ];
  bool friendBool = false;
  bool partyBool = false;

  void friendBoolToFalse() {
    setState(() {
      friendBool = false;
    });
  }

  void friendBoolToTrue() {
    setState(() {
      friendBool = true;
    });
  }

  void partyBoolToFalse() {
    setState(() {
      partyBool = false;
    });
  }

  void partyBoolToTrue() {
    setState(() {
      partyBool = true;
    });
  }

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
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1766FF).withOpacity(0.1),
              // border: const Border(
              //   bottom: BorderSide(width: 0.8),
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '친구 목록(${friendlist.length})',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                friendBool
                    ? InkWell(
                        onTap: () {
                          friendBoolToFalse();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          friendBoolToTrue();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      )
              ],
            ),
          ),
          friendBool
              ? Expanded(
                  child: ListView(
                    children:
                        MakeListViewChildrenOfFriendList(friendlist, context),
                  ),
                )
              : Container(),
          Container(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1766FF).withOpacity(0.2),
              //   border: Border(
              //     top: BorderSide(width: 0.8),
              //     bottom: BorderSide(width: 0.8),
              //   ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '파티 목록(${partylist.length})',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                partyBool
                    ? InkWell(
                        onTap: () {
                          partyBoolToFalse();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          partyBoolToTrue();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      )
              ],
            ),
          ),
          partyBool
              ? Expanded(
                  child: ListView(
                    children:
                        MakeListViewChildrenOfPartyList(partylist, context),
                  ),
                )
              : Container()
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
            bottom: BorderSide(width: 0.2),
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
            bottom: BorderSide(width: 0.2),
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
