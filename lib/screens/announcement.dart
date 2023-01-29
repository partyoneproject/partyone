import 'package:flutter/material.dart';
import 'package:partyone/models/announcement_data.dart';
import 'package:partyone/screens/announcement_detail.dart';
import 'package:partyone/screens/create_announcement.dart';

class Announcement extends StatelessWidget {
  const Announcement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateAnnouncement(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text('공지사항'),
      ),
      body: ListView.builder(
        itemCount: announcementData.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.3)),
              ),
              height: 60,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AnnouncementDetail(announcementId: index),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${announcementData[index]["Title"]}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        shortenText(index),
                      ],
                    ),
                    Text('${announcementData[index]["When"]}')
                  ],
                ),
              )

              // Text(' ${announcementData[index]["Title"]}')

              );
        },
      ),
    );
  }
}

Text shortenText(index) {
  if (announcementData[index]["contents"].length < 25) {
    return Text('${announcementData[index]["contents"]}');
  } else {
    return Text(
      '${'${announcementData[index]["contents"]}'.substring(0, 22)}...',
    );
  }
}
