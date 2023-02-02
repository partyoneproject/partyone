import 'dart:math';

import 'package:flutter/material.dart';
import 'package:partyone/models/party_model.dart';
import 'package:partyone/services/api_service.dart';
import 'package:partyone/widget/hash_tag.dart';
import 'package:partyone/widget/party_card.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController(initialPage: 0);

  final double sliverMinHeight = 80.0, sliverMaxHeight = 500.0;
  int pageIndex = 0;

  final Future<List<PartyModel>> myparties = ApiService.getParties();
  final List<Map> data = [
    {"Where": "신촌", "When": "10.27", "Name": "축구", "img": "soccer.jpg"},
    {"Where": "연희동", "When": "01.17", "Name": "밥먹을 사람~", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
    {"Where": "강남", "When": "09.15", "Name": "코딩", "img": "food.jpg"},
    {"Where": "신촌", "When": "10.27", "Name": "축구", "img": "soccer.jpg"},
    {"Where": "신촌", "When": "10.27", "Name": "축구", "img": "soccer.jpg"},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: headerSliverBuilder,
        body: Container(
          margin: EdgeInsets.only(top: sliverMinHeight),
          child: mainPageView(),
        ),
      ),
    );
  }

  List<Widget> headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderDelegateCS(
            minHeight: sliverMinHeight,
            maxHeight: sliverMaxHeight,
            minChild: minTopChild(),
            maxChild: topChild(),
          ),
        ),
      ),
    ];
  }

  Widget minTopChild() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "활동",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        pageButtonLayout(),
      ],
    );
  }

  Widget topChild() {
    return Column(children: <Widget>[
      Expanded(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // background image and bottom contents
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/backgroundimg.jpg'))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "뷔",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const Text(
                        "안녕하세요 저는 BTS 뷔 입니다.",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: const [
                          HashTag(hashtag: "개발"),
                          HashTag(hashtag: "백엔드"),
                          HashTag(hashtag: "인공지능"),
                          HashTag(hashtag: "술"),
                          HashTag(hashtag: "INTP"),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "관심사",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: const [
                              Chip(
                                  label: Text("카테고리1"),
                                  labelPadding: EdgeInsets.all(2.0)),
                              Chip(
                                  label: Text("카테고리2"),
                                  labelPadding: EdgeInsets.all(2.0)),
                              Chip(
                                  label: Text("카테고리 3"),
                                  labelPadding: EdgeInsets.all(2.0))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // Profile image
              Positioned(
                top: 150.0,
                left: 10.0, // (background container size) - (circle height / 2)
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(
                      image: AssetImage("assets/images/profile.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // 설정 및 편집 버튼
              Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    title: const Text(""),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: [
                      IconButton(
                          onPressed: () => {}, icon: const Icon(Icons.edit)),
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () => {},
                      )
                    ],
                  ))
            ],
          ),
        ),
      )
    ]);
  }

  Widget pageButtonLayout() {
    return SizedBox(
      height: sliverMinHeight / 2,
      child: Row(
        children: <Widget>[
          Expanded(child: pageButton("모든 파티", 0)),
          Expanded(child: pageButton("파티장", 1)),
          Expanded(child: pageButton("파티원", 2)),
          Expanded(child: pageButton("달력", 3)),
        ],
      ),
    );
  }

  Widget pageButton(String title, int page) {
    final fontColor =
        pageIndex == page ? const Color(0xFF2C313C) : const Color(0xFF9E9E9E);
    final lineColor =
        pageIndex == page ? const Color(0xFF014F90) : const Color(0xFFF1F1F1);

    return InkWell(
      splashColor: const Color(0xFF204D7E),
      onTap: () => pageBtnOnTap(page),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: fontColor,
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            color: lineColor,
          ),
        ],
      ),
    );
  }

  pageBtnOnTap(int page) {
    setState(() {
      pageIndex = page;
      pageController.animateToPage(pageIndex,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCirc);
    });
  }

  Widget mainPageView() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        pageItem(
          CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
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
                ),
              ]),
        ),
        pageItem(CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            slivers: [
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
              ),
            ])),
        pageItem(const Center(
          child: Text("page 3"),
        )),
        pageItem(const Center(
          child: Text("page 4"),
        )),
      ],
      onPageChanged: (index) => setState(() => pageIndex = index),
    );
  }

  Widget pageItem(Widget child) {
    double statusHeight = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;
    double minHeight = height - statusHeight - sliverMinHeight;

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        constraints: BoxConstraints(minHeight: minHeight),
        child: child,
      ),
    );
  }
}

class SliverHeaderDelegateCS extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegateCS({
    required this.minHeight,
    required this.maxHeight,
    required this.maxChild,
    required this.minChild,
  });
  final double minHeight, maxHeight;
  final Widget maxChild, minChild;

  late double visibleMainHeight, animationVal, width;

  @override
  bool shouldRebuild(SliverHeaderDelegateCS oldDelegate) => true;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;

    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    width = MediaQuery.of(context).size.width;
    visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    animationVal = scrollAnimationValue(shrinkOffset);

    return Container(
        height: visibleMainHeight,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFFFFFFF),
        child: Stack(
          children: <Widget>[
            getMinTop(),
            animationVal != 0 ? getMaxTop() : Container(),
          ],
        ));
  }

  Widget getMaxTop() {
    return Positioned(
      bottom: 0.0,
      child: Opacity(
        opacity: animationVal,
        child: SizedBox(
          height: maxHeight,
          width: width,
          child: maxChild,
        ),
      ),
    );
  }

  Widget getMinTop() {
    return Opacity(
      opacity: 1 - animationVal,
      child: SizedBox(height: visibleMainHeight, width: width, child: minChild),
    );
  }
}
