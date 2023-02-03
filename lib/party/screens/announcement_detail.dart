import 'package:flutter/material.dart';
import 'package:partyone/party/domain/models/announcement_data.dart';

class AnnouncementDetail extends StatefulWidget {
  final int announcementId;
  const AnnouncementDetail({
    super.key,
    required this.announcementId,
  });

  @override
  State<AnnouncementDetail> createState() => _AnnouncementDetailState();
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
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
        title: Text('${announcementData[idx]["Title"]}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${announcementData[idx]["When"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${announcementData[idx]["contents"]}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
