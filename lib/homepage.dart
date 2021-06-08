import 'package:flutter/material.dart';

import './screen/add_milk_screen.dart';
import './screen/add_user_screen.dart';
import './screen/edit_user_screen.dart';
import './screen/view_user_screen.dart';

class HomePage extends StatelessWidget {
  void addMilkScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AddMilkScreen.routeName);
  }

  void addUserScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AddUserScreen.routeName);
  }

  void editUserScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(EditUserScreen.routeName);
  }

  void viewUserScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ViewUserScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: GridView(
        padding: EdgeInsets.all(50),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          InkWell(
            onTap: () => addMilkScreen(context),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 10,
              child: Center(
                  child: Text('Add Milk',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
            ),
          ),
          InkWell(
            onTap: () => viewUserScreen(context),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 10,
              child: Center(
                  child: Text('View User',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
            ),
          ),
          InkWell(
            onTap: () => addUserScreen(context),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 10,
              child: Center(
                  child: Text(
                'Add User',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 10,
              child: Center(
                  child: Text(
                'Edit User',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
