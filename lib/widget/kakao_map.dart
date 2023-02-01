import 'package:flutter/material.dart';

class KakaoMapScreen extends StatefulWidget {
  const KakaoMapScreen({super.key});

  @override
  State<KakaoMapScreen> createState() => _KakaoMapScreenState();
}

class _KakaoMapScreenState extends State<KakaoMapScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(),
        // body: KakaoMap(
        //   markers: [
        //     Marker(
        //         markerId: "basic",
        //         latLng: LatLng(37.564088999999996, 126.93898089999999))
        //   ],
        //   center: LatLng(37.564088999999996, 126.93898089999999),
        // ),
        );
  }
}
