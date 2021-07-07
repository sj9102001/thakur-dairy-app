import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_detail.dart';
import '../models/http_exception.dart';

class SearchUser with ChangeNotifier {
  List<UserDetail> _searchedUsers = [];

  List<UserDetail> get searchedUsers {
    return [..._searchedUsers];
  }

  UserDetail getByPhoneNumber(String pNo) {
    return _searchedUsers
        .firstWhere((element) => element.phoneNo.toString() == pNo);
  }

  Future<List<UserDetail>> searchByName(String name) async {
    var url = Uri.parse(
        'https://rclklgfkb5.execute-api.us-east-1.amazonaws.com/test/view-detail/name/$name');
    try {
      final response = await http.get(url);
      print(response.statusCode);
      final va = json.decode(response.body);
      print(json.decode(response.body));
      if (response.statusCode != 200) {
        throw HttpException(response.body);
      }
      print('get search by name from server');
      final extractedData = json.decode(response.body) as List;
      Map tempData = {};
      final List<UserDetail> loadedData = [];
      extractedData.forEach((element) {
        tempData = element;

        loadedData.add(UserDetail(
          address: tempData['Address'],
          landmark: tempData['Landmark'],
          firstName: tempData['FirstName'],
          lastName: tempData['LastName'],
          phoneNo: tempData['PhoneNo'],
          plusCode: tempData['PlusCode'],
        ));
      });

      _searchedUsers = loadedData;

      return _searchedUsers;
    } catch (error) {
      throw error;
    }
  }
}
