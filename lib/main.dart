import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:partyone/screens/main_screen.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '417cc2e76cac3d146bd0fcb7092162b4',
    javaScriptAppKey: '139214de4691bbf379d084050fa68d30',
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScreen(),
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
