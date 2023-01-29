import 'dart:convert';

import 'package:partyone/models/party_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://32979dcf-bf13-4289-bbfa-a87636766b6b.mock.pstmn.io";
  static Future<List<PartyModel>> getParties() async {
    List<PartyModel> partyInstances = [];
    final url = Uri.parse('$baseUrl/parties');
    print(url);
    final response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      print("Ok_1");
      final List<dynamic> parties =
          jsonDecode(response.body); //여기서 body는 그냥 텍스트, 이 텍스트를 json으로 디코딩
      print("parties : $parties");
      for (var party in parties) {
        partyInstances.add(PartyModel.fromJson(party));
      }
      return partyInstances;
    }
    throw Error;
  }
}
