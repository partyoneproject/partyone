import 'package:flutter/material.dart';
import 'package:partyone/account/screens/notification_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final newQuestion = TextEditingController();
  bool alarmBool = false;
  bool alarmAuthBool = false;
  void alarmBooltoTrue() {
    setState(() {
      alarmBool = true;
    });
  }

  void alarmBooltoFalse() {
    setState(() {
      alarmBool = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const NotificationScreen())));
              },
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.2),
                    top: BorderSide(width: 0.2),
                  ),
                ),
                child: const Text(
                  '공지사항',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            alarmBool
                ? InkWell(
                    onTap: () {
                      alarmBooltoFalse();
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.2),
                        ),
                      ),
                      child: const Text(
                        '알림설정',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      alarmBooltoTrue();
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.2),
                        ),
                      ),
                      child: const Text(
                        '알림설정',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
            alarmBool
                ? Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '알림설정',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('파티원에서 제공하는 푸시 알람을 받으시겠습니까?')
                          ],
                        ),
                        Switch(
                            value: alarmAuthBool,
                            onChanged: (value) {
                              setState(() {
                                alarmAuthBool = value;
                              });
                            })
                      ],
                    ),
                  )
                : Container(),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        //Dialog Main Title
                        title: Column(
                          children: const <Widget>[
                            Text("문의하기"),
                          ],
                        ),
                        //
                        content: TextField(
                          maxLines: 10,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '문의 내용',
                          ),
                          controller: newQuestion,
                        ),
                        actions: <Widget>[
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "취소",
                                style: TextStyle(color: Colors.red.shade600),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text("확인"),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.2),
                  ),
                ),
                child: const Text(
                  '문의하기',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.2),
                  ),
                ),
                child: const Text(
                  '계정/정보 설정',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: const Text(
                  '버전',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: const Text(
                  '약관확인',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: const Text(
                  '회원탈퇴',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    color: Colors.red.shade600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
