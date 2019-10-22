import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  RestaurantScreen({Key key}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Text("restaurantScreen"),
    );
  }
}
