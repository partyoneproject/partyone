import 'package:flutter/material.dart';
import 'package:partyone/screens/party_detail.dart';
import 'package:partyone/widget/hash_tag.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map> data = [
    {
      "Where": "신촌",
      "When": "10.27",
      "Name": "축구",
      "img": "assets/images/soccer.jpg"
    },
    {
      "Where": "연희동",
      "When": "01.17",
      "Name": "밥먹을 사람~",
      "img": "assets/images/food.jpg"
    },
    {
      "Where": "강남",
      "When": "09.15",
      "Name": "코딩",
      "img": "assets/images/food.jpg"
    },
    {
      "Where": "강남",
      "When": "09.15",
      "Name": "코딩",
      "img": "assets/images/food.jpg"
    },
    {
      "Where": "강남",
      "When": "09.15",
      "Name": "코딩",
      "img": "assets/images/food.jpg"
    },
    {
      "Where": "강남",
      "When": "09.15",
      "Name": "코딩",
      "img": "assets/images/food.jpg"
    },
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
            mainAxisExtent: 240,
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

//PartyCard 하나
class PartyCard extends StatelessWidget {
  final partyName;
  final partyWhen;
  final partyWhere;
  final partyImage;

  const PartyCard(
      {super.key,
      required this.partyName,
      required this.partyWhen,
      required this.partyWhere,
      required this.partyImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PartyDetail(),
              fullscreenDialog: true,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //사진 이미지
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage(partyImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    partyName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Row(
                children: const [
                  HashTag(hashtag: "해시태그 1"),
                  HashTag(hashtag: "해시태그 2"),
                  HashTag(hashtag: "해시태그 3")
                ],
              )
            ],
          ),
        ));
  }
}