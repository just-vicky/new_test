import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/widgets/user_item.dart';

class TitleScreen extends StatefulWidget {
  static const routeName = '/title-screen';

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titles'),
      ),
      body: Container(
        height: 200,
        child: ListView.builder(
          itemBuilder: (context, index) => UserItem(index),
          itemCount: 10,
        ),
      ),
    );
  }
}
