import 'package:dairyapp/screen/edit_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_user.dart';
import '../widgets/user_detail_list_tile.dart';

class UserDetailScreen extends StatelessWidget {
  static const routeName = '/user-detail';
  @override
  Widget build(BuildContext context) {
    final _phoneNo = ModalRoute.of(context).settings.arguments;
    final _userDetail =
        Provider.of<SearchUser>(context).getByPhoneNumber(_phoneNo);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditUserScreen.routeName,
                      arguments: _userDetail.phoneNo);
                })
          ],
          title: Text(
              '${_userDetail.firstName} ${_userDetail.lastName}\'s Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserDetailListTile(userDetail: _userDetail),
        ));
  }
}
