import 'package:flutter/material.dart';
import 'package:partyone/home/screens/home_screen.dart';
import 'package:partyone/home/screens/message_screen.dart';
import 'package:partyone/home/screens/search_screen.dart';
import 'package:partyone/home/screens/upload_screen.dart';
import 'package:partyone/home/screens/user_screen.dart';

// 바텀 내비게이션바가 있는 뼈대 스크린
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int homeIdx = 0;

  void onClickTab(int idx) {
    setState(() {
      if (idx == 2) {
        Navigator.of(context).push(PageRouteBuilder(
          fullscreenDialog: true,
          pageBuilder: (_, __, ___) => const UploadScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ));
      } else {
        homeIdx = idx;
      }
    });
  }

  final List<Widget> homeContents = <Widget>[
    HomeScreen(),
    const SearchScreen(),
    HomeScreen(),
    const MessageScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeContents.elementAt(homeIdx),
      bottomNavigationBar: BottomNavigationBar(
        // selectedFontSize: 12.0,
        // unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        onTap: onClickTab,
        currentIndex: homeIdx,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '파티 찾기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, size: 32),
            label: "파티 만들기",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_rounded),
            label: "채팅",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 정보',
          ),
        ],
      ),
    );
  }
}
