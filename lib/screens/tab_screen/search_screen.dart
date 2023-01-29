import 'package:flutter/material.dart';
import 'package:partyone/widget/party_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map> data = [
    {"Where": "신촌", "When": "10.27", "Name": "축구", "img": "soccer.jpg"},
    {"Where": "연희동", "When": "01.17", "Name": "밥먹을 사람~", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          //SliverAppBar title
          elevation: 0,
          pinned: true,
          floating: true,
          snap: false,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: const Text(
            'PARTYONE',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
          ),
          bottom: AppBar(
            backgroundColor: Colors.white,
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '파티검색하기',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //     widget.categoryVariables[widget.partyCategory]!["crossAxisCount"]!,
            mainAxisExtent: 256,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: data.length,
            (BuildContext context, int index) {
              return PartyCard(
                  //widget.categoryVariables[widget.partyCategory]!["aspectRatio"],
                  partyName: data[index]["Name"],
                  partyWhen: data[index]["When"],
                  partyWhere: data[index]["Where"],
                  partyImage: data[index]["img"]);
            },
          ),
        )
      ]),
    );
  }
}
