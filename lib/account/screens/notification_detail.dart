import 'package:flutter/material.dart';
import 'package:partyone/account/domain/models/notification_data.dart';

class NotificationDetail extends StatefulWidget {
  final int announcementId;
  const NotificationDetail({
    super.key,
    required this.announcementId,
  });

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  late int idx;
  @override
  void initState() {
    super.initState();
    idx = widget.announcementId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text('${notificationData[idx]["Title"]}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${notificationData[idx]["When"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${notificationData[idx]["contents"]}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
