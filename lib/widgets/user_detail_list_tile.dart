import 'package:flutter/material.dart';

import '../models/user_detail.dart';

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
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20)),
          child: Card(
            elevation: 8,
            child: Row(
              children: [
                Text('Name: ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                Text('${_userDetail.firstName} ${_userDetail.lastName} ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Divider(
          height: 10,
        ),
        Card(
          elevation: 8,
          child: Row(
            children: [
              Text('Phone Number: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text('${_userDetail.phoneNo} ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            ],
          ),
        ),
        Divider(
          height: 10,
        ),
        Card(
          elevation: 8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      '${_userDetail.address}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
        ),
        Card(
          elevation: 8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Landmark: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      '${_userDetail.landmark}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
