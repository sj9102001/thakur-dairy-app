import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './homepage.dart';
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
  // This widget is the root of your application.
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
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            scaffoldBackgroundColor: Colors.white),
        routes: {
          AddMilkScreen.routeName: (ctx) => AddMilkScreen(),
          AddUserScreen.routeName: (ctx) => AddUserScreen(),
          ViewUserScreen.routeName: (ctx) => ViewUserScreen(),
          EditUserScreen.routeName: (ctx) => EditUserScreen(),
          UserDetailScreen.routeName: (ctx) => UserDetailScreen(),
        },
        home: HomePage(),
      ),
    );
  }
}
