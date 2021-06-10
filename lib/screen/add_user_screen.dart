import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_detail.dart';
import '../providers/user_details.dart';
import '../models/http_exception.dart';

class AddUserScreen extends StatefulWidget {
  static const routeName = '/add-user';

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final _formKey = GlobalKey<FormState>();

class _AddUserScreenState extends State<AddUserScreen> {
  String errorMessage = '';

  var _isLoading = false;
  final _lastNameFocusNode = FocusNode();
  final _phoneNoFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _landmarkFocusNode = FocusNode();
  final _plusCodeFocusNode = FocusNode();

  @override
  void dispose() {
    _lastNameFocusNode.dispose();
    _phoneNoFocusNode.dispose();
    _plusCodeFocusNode.dispose();
    _addressFocusNode.dispose();
    _landmarkFocusNode.dispose();

    super.dispose();
  }

  var _enteredUser = UserDetail(
      address: '',
      landmark: '',
      plusCode: '',
      firstName: '',
      lastName: '',
      phoneNo: '');

  Future<void> _showErrorDialog(String message) {
    return showDialog(
      context: _scaffoldKey.currentContext,
      builder: ((context) => AlertDialog(
            title: Text('An error occured'),
            content: Text('$message'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Text('Okay'),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build method of add user');
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Add User'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  return;
                }

                _formKey.currentState.save();
                setState(() {
                  _isLoading = true;
                });
                try {
                  await Provider.of<UserDetails>(context, listen: false)
                      .addUser(_enteredUser);
                } on HttpException catch (error) {
                  print(error);
                  if (error.toString().contains('User already exist')) {
                    errorMessage =
                        'User already exist, to edit an user please use edit service.';
                  }
                  await _showErrorDialog(errorMessage);
                } catch (error) {
                  errorMessage = 'Something Went Wrong!';
                  await _showErrorDialog(errorMessage);
                } finally {
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'First Name'),
                        textInputAction: TextInputAction.next, autofocus: true,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_lastNameFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'First Name is required';
                          }
                        },
                        // autofocus: true,
                        onSaved: (value) {
                          _enteredUser = UserDetail(
                              firstName: value,
                              lastName: _enteredUser.lastName,
                              landmark: _enteredUser.landmark,
                              address: _enteredUser.address,
                              phoneNo: _enteredUser.phoneNo,
                              plusCode: _enteredUser.plusCode);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Last Name'),
                        textInputAction: TextInputAction.next,
                        focusNode: _lastNameFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_phoneNoFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Last Name is required';
                          }
                        },
                        onSaved: (value) {
                          _enteredUser = UserDetail(
                              firstName: _enteredUser.firstName,
                              lastName: value,
                              landmark: _enteredUser.landmark,
                              address: _enteredUser.address,
                              phoneNo: _enteredUser.phoneNo,
                              plusCode: _enteredUser.plusCode);
                        },
                        // autofocus: true,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Phone number'),
                        maxLength: 10,
                        textInputAction: TextInputAction.next,
                        focusNode: _phoneNoFocusNode,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_addressFocusNode);
                        },
                        // autofocus: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone number is required';
                          }
                        },
                        onSaved: (value) {
                          _enteredUser = UserDetail(
                              firstName: _enteredUser.firstName,
                              lastName: _enteredUser.lastName,
                              landmark: _enteredUser.landmark,
                              address: _enteredUser.address,
                              phoneNo: value,
                              plusCode: _enteredUser.plusCode);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Address'),
                        maxLines: 2,
                        focusNode: _addressFocusNode,
                        keyboardType: TextInputType.multiline,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_landmarkFocusNode);
                        },
                        // autofocus: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Address is required';
                          }
                        },
                        onSaved: (value) {
                          _enteredUser = UserDetail(
                              firstName: _enteredUser.firstName,
                              lastName: _enteredUser.lastName,
                              landmark: _enteredUser.landmark,
                              address: value,
                              phoneNo: _enteredUser.phoneNo,
                              plusCode: _enteredUser.plusCode);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Landmark'),
                        maxLines: 3,
                        focusNode: _landmarkFocusNode,
                        keyboardType: TextInputType.multiline,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_plusCodeFocusNode);
                        },
                        // autofocus: true,
                        onSaved: (value) {
                          _enteredUser = UserDetail(
                              firstName: _enteredUser.firstName,
                              lastName: _enteredUser.lastName,
                              landmark: value,
                              address: _enteredUser.address,
                              phoneNo: _enteredUser.phoneNo,
                              plusCode: _enteredUser.plusCode);
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Plus Code'),
                        textInputAction: TextInputAction.next,
                        focusNode: _plusCodeFocusNode,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (double.parse(value) < 0 ||
                              // ignore: unrelated_type_equality_checks
                              double.tryParse(value) == false) {
                            return 'PlusCode required';
                          }
                        },
                        // autofocus: true,
                        onSaved: (value) {
                          _enteredUser = UserDetail(
                              firstName: _enteredUser.firstName,
                              lastName: _enteredUser.lastName,
                              landmark: _enteredUser.landmark,
                              address: _enteredUser.address,
                              phoneNo: _enteredUser.phoneNo,
                              plusCode: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
