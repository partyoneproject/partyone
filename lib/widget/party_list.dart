import 'package:flutter/cupertino.dart';
import 'package:partyone/models/party_model.dart';
import 'package:partyone/widget/party_card.dart';

// party card들을 보는 리스트
ListView makePartyList(AsyncSnapshot<List<PartyModel>> snapshot) {
  return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
//사용자가 보는 아이템만 빌드-> 메모리 최적화됨
        var party = snapshot.data![index];

        return PartyCard(
            partyName: party.partyName,
            partyWhen: party.partyWhen,
            partyWhere: party.partyWhere,
            partyImage: party.thumb);
      },
      separatorBuilder: ((context, index) => const SizedBox(width: 16)),
      itemCount: snapshot.data!.length);
}
