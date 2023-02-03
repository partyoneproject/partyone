import 'package:flutter/material.dart';
import 'package:partyone/account/domain/models/notification_data.dart';
import 'package:partyone/account/screens/notification_detail.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('공지 알람'),
      ),
      body: ListView.builder(
        itemCount: notificationData.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.3)),
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotificationDetail(announcementId: index),
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
                          '${notificationData[index]["Title"]}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        shortenText2(index),
                      ],
                    ),
                    Text('${notificationData[index]["When"]}')
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

Text shortenText2(index) {
  if (notificationData[index]["contents"].length < 25) {
    return Text('${notificationData[index]["contents"]}');
  } else {
    return Text(
      '${'${notificationData[index]["contents"]}'.substring(0, 22)}...',
    );
  }
}
