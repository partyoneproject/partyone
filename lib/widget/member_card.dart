//멤버 한명 렌더링 사진, 역할, 학교이름
import 'package:flutter/cupertino.dart';

class MemberComponenet extends StatelessWidget {
  const MemberComponenet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: const SizedBox(
                height: 48,
                width: 48,
                child: Image(
                  image: AssetImage("assets/images/profile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "이름",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const Text("연세대학교",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
