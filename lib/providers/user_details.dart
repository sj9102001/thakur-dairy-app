import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/http_exception.dart';
import '../models/user_detail.dart';

class UserDetails with ChangeNotifier {
  List<UserDetail> _users = [];

  List<UserDetail> get users {
    return [..._users];
  }

  Future<void> updateProduct(UserDetail userDetail) async {
    var url = Uri.parse(
        '');
    print(userDetail.lastName);
    print('i update to server');
    try {
      final response = await http.post(url,
          body: json.encode({
            'Address': userDetail.address,
            'Landmark': userDetail.landmark,
            'PlusCode': userDetail.plusCode,
            'FirstName': userDetail.firstName,
            'LastName': userDetail.lastName,
            'PhoneNo': userDetail.phoneNo
          }));

      print(response.body);
    } catch (error) {
      throw error;
    }
  }

  Future<void> addUser(UserDetail userDetail) async {
    var url = Uri.parse(
        '');
    print('i add to server');
    try {
      final response = await http.post(url,
          body: json.encode({
            'Address': userDetail.address,
            'Landmark': userDetail.landmark,
            'PlusCode': userDetail.plusCode,
            'FirstName': userDetail.firstName,
            'LastName': userDetail.lastName,
            'PhoneNo': userDetail.phoneNo
          }));
      final _newUser = UserDetail(
          address: userDetail.address,
          landmark: userDetail.landmark,
          plusCode: userDetail.plusCode,
          firstName: userDetail.firstName,
          lastName: userDetail.lastName,
          phoneNo: userDetail.phoneNo);

      _users.add(_newUser);
      print(response.body);
      if (response.statusCode != 201) {
        throw HttpException(response.body);
      }
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
