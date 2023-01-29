import 'package:flutter/material.dart';
import 'package:partyone/widget/sign_up.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            const SizedBox(
              height: 170,
            ),
            const Icon(
              Icons.account_circle,
            ),
            const SizedBox(
              height: 170,
            ),
            //회원가입
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (const TypeInfoScreen()),
                  ),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffA9A9A9)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "회원가입",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff757575),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchoolCertificationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 300,
                  height: 50,
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffA5A5A5)),
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffA5A5A5)),
                  child: const Text(
                    "로그인",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                  ),
                )),
          ]),
        ],
      ),
    );
  }
}
