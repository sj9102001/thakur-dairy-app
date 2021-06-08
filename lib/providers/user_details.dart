import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/http_exception.dart';
import './user_detail.dart';

class UserDetails with ChangeNotifier {
  List<UserDetail> _users = [];

  List<UserDetail> get users {
    return [..._users];
  }

  Future<void> updateProduct(UserDetail userDetail) async {
    var url = Uri.parse(
        'https://rclklgfkb5.execute-api.us-east-1.amazonaws.com/test/edit-user');
    print(userDetail.lastName);
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
        'https://rclklgfkb5.execute-api.us-east-1.amazonaws.com/test/add-user');
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

    // print(_newUser.landmark);
    // print(_newUser.address);
    // print(_newUser.name);
    // print(_newUser.milkBalance);
    // print(_newUser.phoneNo);
  }
}
