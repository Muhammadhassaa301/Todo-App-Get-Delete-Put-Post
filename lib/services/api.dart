import 'dart:convert';

import 'package:apigetgetx/constants/constants.dart';
import 'package:apigetgetx/models/getsapiModel.dart';
import 'package:http/http.dart' as http;

class AuthenicationService {
  Future<List<Getapi>?> apiService() async {
    String url = apicontant.baseurl + apicontant.endpoint;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return getapiFromJson(response.body);
    }

    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('something Went Wrong');
    }
  }
}

class authenticationpost {
  Future<List<Getapi>?> apiServicePost() async {
    var url = Uri.parse(apicontant.baseurl + apicontant.endpoint);
    var response = await http.post(url, body: {
      "title": "Hassaan55",
      "description": "Muhammad Hassaan Arain",
      "category": "4",
      "timestamp": "1648563540",
      "priority": "69",
      "user_id": "user_id 3",
      "isCompleted": "true",
      "id": "7"
    });
  }
}

class authenicationPut {
  Future<List<Getapi>> updateAlbum(String id, String title) async {
    var url = Uri.parse(apicontant.baseurl + apicontant.edit(id));
    Map<String, String> data = {'id': id, 'title': title};
    final response = await http.put(
      url,
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },

      body: data,
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return getapiFromJson(response.body);
      }
      if (response.statusCode == 500) {
        print(response.statusCode);
        throw Exception('Server Error');
      } else {
        print(response.statusCode);
        throw Exception('Failed to update album.');
      }
    } on Exception catch (_) {
      print(response.statusCode);
      print("throwing new error");
      throw Exception("Error on server");
    }
  }
}

// if (response.statusCode == 200) {
  //   return Getapi.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to loading');
  // }


// class apiService {
//   Future<List<Getapi>?> getUser() async {
//     var url = Uri.parse(apicontant.baseurl + apicontant.endpoint);
//     var response = await http.get(url);
//     //  var responseData = jsonDecode(response.body);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return getapiFromJson(response.body);
//     }
//   }
// }
