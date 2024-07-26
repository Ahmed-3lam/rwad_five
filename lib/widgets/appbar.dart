import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    leading: Icon(
      Icons.menu,
      color: Colors.white,
    ),
    title: Text(
      "Hello  World!",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      Icon(
        Icons.camera_alt,
        color: Colors.white,
      ),
      SizedBox(
        width: 20,
      ),
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      SizedBox(
        width: 20,
      ),
    ],
  );
}
