import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class KakaoMapScreen extends StatefulWidget {
  const KakaoMapScreen({super.key});

  @override
  State<KakaoMapScreen> createState() => _KakaoMapScreenState();
}

class _KakaoMapScreenState extends State<KakaoMapScreen> {
  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = {};
    return Scaffold(
      appBar: AppBar(),
      body: KakaoMap(
        onMapCreated: ((controller) async {
          markers.add(Marker(
              markerId: UniqueKey().toString(),
              latLng: await controller.getCenter()));
          setState(() {});
        }),
        markers: markers.toList(),
        center: LatLng(37.564088999999996, 126.93898089999999),
      ),
    );
  }
}
