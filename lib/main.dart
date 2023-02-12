import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:partyone/home/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//import 'package:kakao_map_plugin/kakao_map_plugin.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  //kakao map key initialize
  //AuthRepository.initialize(appKey: '139214de4691bbf379d084050fa68d30');

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '417cc2e76cac3d146bd0fcb7092162b4',
    javaScriptAppKey: '139214de4691bbf379d084050fa68d30',
  );
  //firebase 관
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  var fcmToken = await FirebaseMessaging.instance.getToken(
      vapidKey:
          "BBosCrY1FxptWPYOkiI2HFmHMyaiodZ51mmoAulc4qGKIp_5QA_zqSyr3GNLecKzrxIMS0ZKa4mNUymJ3rPXmLA");
  print('fcmToken은$fcmToken');

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
