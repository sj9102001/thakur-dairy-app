import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/homepage.dart';
import './constant.dart';
import './screen/add_milk_screen.dart';
import './screen/add_user_screen.dart';
import './screen/edit_user_screen.dart';
import './screen/view_user_screen.dart';
import './providers/user_details.dart';
import './providers/search_user.dart';
import './screen/user_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserDetails(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SearchUser(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: Colors.amber,
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          AddMilkScreen.routeName: (ctx) => AddMilkScreen(),
          AddUserScreen.routeName: (ctx) => AddUserScreen(),
          ViewUserScreen.routeName: (ctx) => ViewUserScreen(),
          EditUserScreen.routeName: (ctx) => EditUserScreen(),
          UserDetailScreen.routeName: (ctx) => UserDetailScreen(),
        },
        home: Container(child: HomePage()),
      ),
    );
  }
}
