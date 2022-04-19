import 'dart:convert';

import 'package:first_api/models/prescriptions.dart';
import 'package:http/http.dart' as http;

class RemoteService{
  Future<List<Prescriptions>?> getPresc() async{
    print("Reached calling");
    // var client = http.Client();
    var uri = Uri.parse('http://192.168.37.1:8000/drugs/drug/Chymapra');
    var response = await http.get(uri);
    print(response.body);
    if(response.statusCode == 200){
      // var json = response.body;
      // return postfromJson(json);
      List<Prescriptions> prescs = (json.decode(response.body) as List)
          .map((data) => Prescriptions.fromJson(data))
          .toList();
      return prescs;
    }
  }
}