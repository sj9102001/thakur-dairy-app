import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_user.dart';
import '../models/user_detail.dart';
import '../providers/user_details.dart';

class EditUserScreen extends StatefulWidget {
  static const routeName = '/edit-user';

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

final _editFormKey = GlobalKey<FormState>();

class _EditUserScreenState extends State<EditUserScreen> {
  var _isInit = true;
  var _isLoading = false;
  var _toEditUserDetail = UserDetail(
      address: '',
      firstName: '',
      landmark: '',
      lastName: '',
      phoneNo: '',
      plusCode: '');
  var _initValues = {
    'firstName': '',
    'lastName': '',
    'address': '',
    'phoneNo': '',
    'landmark': '',
    'plusCode': '',
  };

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final _editPhoneNumber = ModalRoute.of(context).settings.arguments;
      _toEditUserDetail = Provider.of<SearchUser>(context, listen: false)
          .getByPhoneNumber(_editPhoneNumber);

      _initValues = {
        'firstName': _toEditUserDetail.firstName,
        'lastName': _toEditUserDetail.lastName,
        'address': _toEditUserDetail.address,
        'phoneNo': _toEditUserDetail.phoneNo,
        'landmark': _toEditUserDetail.landmark,
        'plusCode': _toEditUserDetail.plusCode,
      };
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build method of edit user screen');
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              _editFormKey.currentState.save();
              setState(() {
                _isLoading = true;
              });
              await Provider.of<UserDetails>(context, listen: false)
                  .updateProduct(_toEditUserDetail);
              setState(() {
                _isLoading = false;
              });
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _editFormKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['firstName'],
                      decoration: InputDecoration(labelText: 'First Name'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'First Name is required';
                        }
                      },
                      autofocus: true,
                      onSaved: (value) {
                        _toEditUserDetail = UserDetail(
                            firstName: value,
                            lastName: _toEditUserDetail.lastName,
                            landmark: _toEditUserDetail.landmark,
                            address: _toEditUserDetail.address,
                            phoneNo: _toEditUserDetail.phoneNo,
                            plusCode: _toEditUserDetail.plusCode);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['lastName'],
                      decoration: InputDecoration(labelText: 'Last Name'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Last Name is required';
                        }
                      },
                      onSaved: (value) {
                        _toEditUserDetail = UserDetail(
                            firstName: _toEditUserDetail.firstName,
                            lastName: value,
                            landmark: _toEditUserDetail.landmark,
                            address: _toEditUserDetail.address,
                            phoneNo: _toEditUserDetail.phoneNo,
                            plusCode: _toEditUserDetail.plusCode);
                      },
                      autofocus: true,
                    ),
                    TextFormField(
                      initialValue: _initValues['phoneNo'],
                      decoration: InputDecoration(labelText: 'Phone number'),
                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Phone number is required';
                        }
                      },
                      onSaved: (value) {
                        _toEditUserDetail = UserDetail(
                            firstName: _toEditUserDetail.firstName,
                            lastName: _toEditUserDetail.lastName,
                            landmark: _toEditUserDetail.landmark,
                            address: _toEditUserDetail.address,
                            phoneNo: value,
                            plusCode: _toEditUserDetail.plusCode);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['address'],
                      decoration: InputDecoration(labelText: 'Address'),
                      maxLines: 2,
                      keyboardType: TextInputType.multiline,
                      autofocus: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Address is required';
                        }
                      },
                      onSaved: (value) {
                        _toEditUserDetail = UserDetail(
                            firstName: _toEditUserDetail.firstName,
                            lastName: _toEditUserDetail.lastName,
                            landmark: _toEditUserDetail.landmark,
                            address: value,
                            phoneNo: _toEditUserDetail.phoneNo,
                            plusCode: _toEditUserDetail.plusCode);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['landmark'],
                      decoration: InputDecoration(labelText: 'Landmark'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      onSaved: (value) {
                        _toEditUserDetail = UserDetail(
                            firstName: _toEditUserDetail.firstName,
                            lastName: _toEditUserDetail.lastName,
                            landmark: value,
                            address: _toEditUserDetail.address,
                            phoneNo: _toEditUserDetail.phoneNo,
                            plusCode: _toEditUserDetail.plusCode);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['plusCode'],
                      decoration: InputDecoration(labelText: 'Plus Code'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (double.parse(value) < 0) {
                          return 'PlusCode required';
                        }
                      },
                      autofocus: true,
                      onSaved: (value) {
                        _toEditUserDetail = UserDetail(
                            firstName: _toEditUserDetail.firstName,
                            lastName: _toEditUserDetail.lastName,
                            landmark: _toEditUserDetail.landmark,
                            address: _toEditUserDetail.address,
                            phoneNo: _toEditUserDetail.phoneNo,
                            plusCode: value);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
