import 'package:dairyapp/models/http_exception.dart';
import 'package:dairyapp/models/user_detail.dart';
import 'package:dairyapp/screen/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_user.dart';

class ViewUserScreen extends StatefulWidget {
  static const routeName = '/view-user';

  @override
  _ViewUserScreenState createState() => _ViewUserScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _ViewUserScreenState extends State<ViewUserScreen> {
  String errorMessage = '';
  Future<void> _showErrorDialog(String message) {
    return showDialog(
      context: _scaffoldKey.currentContext,
      builder: ((context) => AlertDialog(
            title: Text('An error occured'),
            content: Text('${message}'),
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

  var _isLoading = false;
  String enteredName = '';
  List<UserDetail> _searchedData = [];
  var enteredNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Build method of view user screen');
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('View User'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    autofocus: false,
                    decoration:
                        InputDecoration(labelText: 'Please Enter A Name'),
                    controller: enteredNameController,
                    onSubmitted: (value) async {
                      setState(() {
                        enteredName = enteredNameController.text;
                        _isLoading = true;
                      });
                      try {
                        List searchedData = await Provider.of<SearchUser>(
                                context,
                                listen: false)
                            .searchByName(enteredNameController.text);
                        setState(() {
                          _searchedData = searchedData;
                          _isLoading = false;
                        });
                      } on HttpException catch (error) {
                        if (error.toString().contains('User don\'t exist')) {
                          errorMessage =
                              'User don\'t exist with prefix: ${enteredName}.';
                        }
                        await _showErrorDialog(errorMessage);
                      } catch (error) {
                        errorMessage = 'Something Went Wrong!';
                        await _showErrorDialog(errorMessage);
                      } finally {
                        // setState(() {
                        //   _isLoading = false;
                        // });
                        // Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    setState(() {
                      enteredName = enteredNameController.text;
                      _isLoading = true;
                    });
                    try {
                      List searchedData =
                          await Provider.of<SearchUser>(context, listen: false)
                              .searchByName(enteredNameController.text);
                      setState(() {
                        _searchedData = searchedData;
                        _isLoading = false;
                      });
                    } on HttpException catch (error) {
                      if (error.toString().contains('User don\'t exist')) {
                        errorMessage =
                            'User don\'t exist with prefix: ${enteredName}.';
                      }
                      await _showErrorDialog(errorMessage);
                    } catch (error) {
                      errorMessage = 'Something Went Wrong!';
                      await _showErrorDialog(errorMessage);
                    } finally {
                      // setState(() {
                      //   _isLoading = false;
                      // });
                      // Navigator.of(context).pop();
                    }

                    print(_searchedData);
                  }),
            ],
          ),
          enteredName == ''
              ? Center(child: Text('Enter Name to search'))
              : _isLoading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: ListTile(
                                title: Text(
                                  '${_searchedData[index].firstName.toString()} ${_searchedData[index].lastName.toString()}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    'Phone No: ${_searchedData[index].phoneNo.toString()}'),
                                trailing: Text(
                                  '${_searchedData[index].address.toString()}',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    UserDetailScreen.routeName,
                                    arguments: _searchedData[index].phoneNo);
                              },
                            );
                          },
                          itemCount: _searchedData.length),
                    )
        ],
      ),
    );
  }
}
