// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../providers/items.dart';

class UserScreenItems extends StatefulWidget {
  @override
  State<UserScreenItems> createState() => _UserScreenItemsState();
}

class _UserScreenItemsState extends State<UserScreenItems> {
  // late Future<List<ItemsList>> itemList;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   itemList = fetchAndSetData();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemsList>>(
        future: fetchAndSetData(),
        builder: (context, snapshot) {
          return GridView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              ItemsList itemsList = snapshot.data![index];
              return Container(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/title-screen'),
                  child: Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          minRadius: 30,
                        ),
                        Text(itemsList.name),
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          );
        });
  }

  // Future<List<ItemsList>> fetchAndSetOrders() async {
  //   final url = 'https://637c865016c1b892ebb61f6b.mockapi.io/users';
  //   final response = await http.get(Uri.parse(url));
  //   print(response.body);
  //   final List<ItemsList> loadedItems = [];
  //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //   print(extractedData);

  //   extractedData.forEach(
  //     (key, itemData) {
  //       ItemsList(
  //         designation: itemData['designation'],
  //         id: itemData['id'],
  //         name: itemData['name'],
  //         url: itemData['url'],
  //         createdAt: itemData['createdAt'],
  //       );
  //     },
  //   );

  //   return loadedItems;
  // }
}
