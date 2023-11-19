// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'dart:async';

class HarryPotterCharacter {
  final String name;
  String? imageUrl;
  String? apiName;
  String? characterHouse;
  String? actorRealName;
  String? birth;
  String? patronus; 
  bool? hogwartsStudent;

  int rating = 10;

  HarryPotterCharacter(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      apiName = name.toLowerCase();

      var uri = Uri.https('potterhead-api.vercel.app', '/api/characters/$apiName');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      Map<String, dynamic> data = json.decode(responseBody);
      imageUrl = data["image"];
      characterHouse = data["house"];
      actorRealName = data["actor"];
      birth = data["dateOfBirth"];
      patronus = data["patronus"];
      hogwartsStudent = data["hogwartsStudent"];

      //print(characterHouse);
    } catch (exception) {
      //print(exception);
    }
  }
}