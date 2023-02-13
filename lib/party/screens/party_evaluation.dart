import 'package:flutter/material.dart';

class PartyEvaluation extends StatefulWidget {
  const PartyEvaluation({super.key});

  @override
  State<PartyEvaluation> createState() => _PartyEvaluationState();
}

class _PartyEvaluationState extends State<PartyEvaluation> {
  final friendlist = [
    '이상민',
    '신재현',
    '최성범',
    '박찬혁',
    '이수민',
    '노무현',
    '이명박',
    '박근혜',
    '문재인',
    '윤석열'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: ListOfPartyEvaluation(friendlist),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: 120,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                '완료',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

List<Widget> ListOfPartyEvaluation(List friendlist) {
  List<Widget> result = [];
  for (var i = 0; i < friendlist.length; i++) {
    result.add(
      Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 24,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  friendlist[i],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    child: const Text(
                      '!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade300,
                    ),
                    child: const Icon(Icons.add_circle_outlined)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  return result;
}
