import 'package:flutter/material.dart';

class AddMilkScreen extends StatelessWidget {
  static const routeName = '/add-milk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Milk'),
      ),
      body: Center(
        child: Text('Random'),
      ),
    );
  }
}
