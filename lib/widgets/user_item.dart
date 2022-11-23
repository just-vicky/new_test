import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/title_screen.dart';

class UserItem extends StatefulWidget {
  final int id;
  UserItem(this.id);

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  // void selectUser(BuildContext context) {
  //   Navigator.pushNamed(context, '/title-screen');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () => Navigator.pushNamed(context, '/title-screen'),
      child: Container(
        height: 400,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Card(
            child: Text("Titles"),
          ),
        ),
      ),
    ));
  }
}
