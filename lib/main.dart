import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:partyone/home/main_screen.dart';
//import 'package:kakao_map_plugin/kakao_map_plugin.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  //kakao map key initialize
  //AuthRepository.initialize(appKey: '139214de4691bbf379d084050fa68d30');

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
        fontFamily: 'NanumSquareNeo',
        primaryColor: const Color(0xFF1766FF),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xff002c92)),
      ),
    );
  }
}
