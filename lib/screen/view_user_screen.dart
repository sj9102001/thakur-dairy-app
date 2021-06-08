import 'package:dairyapp/providers/user_detail.dart';
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
  String enteredName = '';
  List<UserDetail> _searchedData = [];
  var enteredNameController = TextEditingController();
  // void nameEntered(String name) {
  //   setState(() {
  //     enteredName = name;
  //   });

  //   print(enteredName);
  // }

  @override
  Widget build(BuildContext context) {
    print('Build method of view user screen');
    // searchedUser = Provider.of<SearchUser>(context).searchedUsers;
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
                      });
                      List searchedData =
                          await Provider.of<SearchUser>(context, listen: false)
                              .searchByName(enteredNameController.text);
                      // UserDetail a = searchedData[0];

                      setState(() {
                        _searchedData = searchedData;
                      });
                      // print(a.firstName);

                      // print(enteredNameController.text);
                    },
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    setState(() {
                      enteredName = enteredNameController.text;
                    });
                    List searchedData =
                        await Provider.of<SearchUser>(context, listen: false)
                            .searchByName(enteredNameController.text);
                    setState(() {
                      _searchedData = searchedData;
                    });
                    print(_searchedData);
                  }),
            ],
          ),
          enteredName == ''
              ? Center(child: Text('Enter Name to search'))
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
