import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<ItemsList> fetchData() async {
//   final response = await http
//       .get(Uri.parse('https://637c865016c1b892ebb61f6b.mockapi.io/users'));

//   if (response.statusCode == 200) {
//     return ItemsList.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

Future<List<ItemsList>> fetchAndSetData() async {
  List<ItemsList> itemList;
  final url = 'https://637c865016c1b892ebb61f6b.mockapi.io/users';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body) as List;
    print(data.length);
    var list = data.map((e) => ItemsList.fromJson(e)).toList();
    // var list = data.map<ItemsList>((json) => ItemsList.fromJson(json)).toList();
    print("list $list");
    // data.forEach(
    // (key, itemData) {
    //   ItemsList(
    //     designation: itemData['designation'],
    //     id: itemData['id'],
    //     name: itemData['name'],
    //     url: itemData['url'],
    //     createdAt: itemData['createdAt'],
    //   );
    // },
    // );

    return list;
  } else {
    throw Exception('Failed to load album');
  }
  // print(response.body);
  // final List<ItemsList> loadedItems = [];
  // final extractedData = json.decode(response.body) as Map<String, dynamic>;
  // print(extractedData);

  // extractedData.forEach(
  //   (key, itemData) {
  //     ItemsList(
  //       designation: itemData['designation'],
  //       id: itemData['id'],
  //       name: itemData['name'],
  //       url: itemData['url'],
  //       createdAt: itemData['createdAt'],
  //     );
  //   },
  // );

  // return loadedItems;
}

class ItemsList {
  final String name;
  final String avatar;
  final int id;
  final String designation;
  final DateTime createdAt;

  ItemsList({
    required this.designation,
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  factory ItemsList.fromJson(Map<String, dynamic> json) {
    print(json);
    return ItemsList(
        designation: json['designation'],
        id: json['id'],
        name: json['name'],
        avatar: json['avatar'],
        createdAt: json['createdAt']);
  }
}

// class Items {}
