import 'package:flutter/material.dart';
import 'package:partyone/party/widgets/party_card.dart';

class selectedList extends ChangeNotifier {
  final List<String> origin;
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  selectedList(this.origin);

  // selectedList(this.origin)
  //     : selected = List.generate(origin.length, (index) => false);

  void changeSelected(int index) {
    selected[index] = selected[index] ? false : true;
    notifyListeners();
  }

  void initialization() {
    // selected = List.generate(origin.length, (index) => false);
    selected[0] = false;
    notifyListeners();
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void refresh() {
    setState(() {});
  }

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'PARTYONE',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: (() {
                  _showFilterSheet();
                }),
                child: const Icon(
                  Icons.format_list_bulleted_sharp,
                  color: Colors.black,
                ),
              )
            ],
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
                partyImage: data[index]["img"],
                view_direction: "horizontal",
              );
            },
          ),
        )
      ]),
    );
  }

  _showFilterSheet() {
    List<String> interest = [
      '봉사활동',
      '스포츠',
      '요리',
      '인문학',
      '공연/축제',
      '댄스/무용',
      '게임/오락',
      '음악/악기',
      '봉사활동',
      '스포츠',
      '요리',
      '인문학',
      '공연/축제',
      '댄스/무용',
      '게임/오락',
      '음악/악기'
    ];
    List<String> location = [
      '연희동',
      '신촌동',
      '대흥동',
      '연남동',
      '남가좌1동',
      '남가좌2동',
      '북아현동',
      '서교동'
    ];

    Map<String, dynamic> filter = {
      'interest': selectedList(interest),
      'location': selectedList(location),
      'numberOfPeople': [1, 20],
    };

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    pinned: true,
                    floating: true,
                    snap: false,
                    centerTitle: false,
                    backgroundColor: Colors.white,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '필터',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '관심분야',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              children: List.generate(
                                  interest.length,
                                  (index) => SelectedButton(
                                        title: interest[index],
                                        index: index,
                                        filter: filter['interest'],
                                      )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '지역',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              children: List.generate(
                                  location.length,
                                  (index) => SelectedButton(
                                        title: location[index],
                                        index: index,
                                        filter: filter['location'],
                                      )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '인원수',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SliderNumber(
                              filter: filter['numberOfPeople'],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InitButton(
                      filter: filter,
                    ),
                    Container(
                      width: 140,
                      height: 60,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 6,
                      ),
                      child: const Text(
                        '확인',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class InitButton extends StatefulWidget {
  InitButton({
    super.key,
    required this.filter,
  });

  Map<String, dynamic> filter;

  @override
  State<InitButton> createState() => _InitButtonState();
}

class _InitButtonState extends State<InitButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.filter['interest'].initialization();
          widget.filter['location'].initialization();
          widget.filter['numberOfPeople'] = [1, 20];
        });
      },
      child: Container(
        width: 140,
        height: 60,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 6,
        ),
        child: const Text(
          '설정 초기화',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class SelectedButton extends StatefulWidget {
  SelectedButton({
    super.key,
    required this.title,
    required this.index,
    required this.filter,
  });

  final String title;
  int index;
  selectedList filter;

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    // bool isSelected = widget.filter[widget.index];
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.filter.changeSelected(widget.index);
          print(widget.filter.selected);
        });
      },
      child: Container(
        width: 80,
        height: 40,
        margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: widget.filter.selected[widget.index]
                ? Colors.blue.shade400
                : Colors.black,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 6,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: widget.filter.selected[widget.index]
                ? Colors.blue
                : Colors.black,
          ),
        ),
      ),
    );
  }
}

class SliderNumber extends StatefulWidget {
  const SliderNumber({
    super.key,
    required this.filter,
  });

  final List<int> filter;

  @override
  State<SliderNumber> createState() => _SliderNumberState();
}

class _SliderNumberState extends State<SliderNumber> {
  RangeValues _currentRangeValues = const RangeValues(1, 20);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      min: 1,
      max: 20,
      divisions: 20,
      labels: RangeLabels(
        "${_currentRangeValues.start.round()}",
        "${_currentRangeValues.end.round()}",
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
      onChangeEnd: (values) {
        setState(() {
          widget.filter[0] = _currentRangeValues.start.round();
          widget.filter[1] = _currentRangeValues.end.round();
        });
      },
    );
  }
}
