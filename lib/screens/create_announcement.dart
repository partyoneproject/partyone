import 'package:flutter/material.dart';
import 'package:partyone/models/announcement_data.dart';
import 'package:partyone/screens/announcement.dart';

class CreateAnnouncement extends StatefulWidget {
  const CreateAnnouncement({super.key});

  @override
  State<CreateAnnouncement> createState() => _CreateAnnouncementState();
}

class _CreateAnnouncementState extends State<CreateAnnouncement> {
  final newAnnouncementTitle = TextEditingController();
  final newAnnouncementContents = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('공지사항 추가'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
                controller: newAnnouncementTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'contents',
                ),
                controller: newAnnouncementContents,
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () => announcementClick(newAnnouncementTitle.text,
                    newAnnouncementContents.text, context),
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade100),
                  child: const Text('만들기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void announcementClick(String title, String contents, context) {
  dynamic newMap = {};
  DateTime dt = DateTime.now();
  if (title == '') {
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
                Text("Title 부재"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Title을 입력해주세요",
                ),
              ],
            ),
            actions: <Widget>[
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
  } else if (contents == '') {
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
                Text("Contents 부재"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Contents를 입력해주세요",
                ),
              ],
            ),
            actions: <Widget>[
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
  } else {
    newMap.putIfAbsent('id', () => announcementData.length);
    newMap.putIfAbsent('Title', () => title);
    newMap.putIfAbsent('contents', () => contents);
    newMap.putIfAbsent('When', () => '${dt.month}.${dt.day}');

    announcementData.insert(0, newMap);
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => const Announcement(),
      ),
    );
  }
}
