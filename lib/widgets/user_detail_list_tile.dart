import 'package:flutter/material.dart';
import '../providers/user_detail.dart';

class UserDetailListTile extends StatelessWidget {
  const UserDetailListTile({
    Key key,
    @required UserDetail userDetail,
  })  : _userDetail = userDetail,
        super(key: key);

  final UserDetail _userDetail;

  @override
  Widget build(BuildContext context) {
    print('build method of user details');
    return ListView(
      children: [
        Row(
          children: [
            Text('Name: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text('${_userDetail.firstName} ${_userDetail.lastName} ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          ],
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Divider(
          height: 10,
        ),
        Row(
          children: [
            Text('Phone Number: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text('${_userDetail.phoneNo} ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          ],
        ),
        Divider(
          height: 10,
        ),
        Row(
          children: [
            Text('Address: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text('${_userDetail.address} ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          ],
        ),
        Divider(
          height: 10,
        ),
        Row(
          children: [
            Text('Landmark: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text('${_userDetail.landmark} ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          ],
        ),
      ],
    );
  }
}

// final String firstName;
// final String lastName;
// final String phoneNo;
// final String address;
// final String plusCode;
// final String landmark;

// UserDetailScreen(
//     {this.address,
//     this.phoneNo,
//     this.lastName,
//     this.firstName,
//     this.landmark,
//     this.plusCode});
