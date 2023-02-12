import 'package:flutter/material.dart';
import 'package:partyone/account/screens/notification_screen.dart';
import 'package:partyone/party/domain/models/party_model.dart';
import 'package:partyone/party/domain/services/api_service.dart';
import 'package:partyone/party/widgets/party_list.dart';
import 'package:partyone/utils/widgets/share.dart';
import 'package:proste_route_animation/proste_route_animation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PartyModel>> myparties = ApiService.getParties();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PARTYONE',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  ProsteRouteAnimation.slideRoute(
                    route: const NotificationScreen(),
                    mode: ProsteSlideMode.fromRight,
                    duration: const Duration(milliseconds: 200),
                    reverseDuration: const Duration(milliseconds: 200),
                    useFade: true,
                    curve: Curves.linear,
                  ))
            },
            child: const Icon(
              Icons.notification_important_outlined,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: (() => {marketUrlShare()}),
            child: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* 
            My Party
            */
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "내 파티",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: FutureBuilder(
                    future: myparties,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return makePartyVerticalList(snapshot);
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
            /* 
            Interested Party
            */
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "관심있는 파티",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  child: FutureBuilder(
                    future: myparties,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return makePartyHorizontalList(snapshot);
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
