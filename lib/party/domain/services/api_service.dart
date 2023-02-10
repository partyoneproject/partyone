import 'dart:convert';

import 'package:partyone/party/domain/models/party_model.dart';
import 'package:http/http.dart' as http;
import 'package:partyone/server_adress.dart';

class ApiService {
  static String partyoneUrl = serverUrl;

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

  // static Future<void> postParty(data) async {
  //   final url = Uri.parse(("$partyoneUrl/party"));

  //   var request = http.MultipartRequest('POST', url);
  //   request.fields[''] =
  //   //http.Response res = await http.post(url, body: {data: data});

  //   return;
  // }
}
