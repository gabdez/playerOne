import 'package:flutter/material.dart';

import '../appTheme.dart';

class RestaurantScreen extends StatefulWidget {
  RestaurantScreen({Key key}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      body: SafeArea(
        top: true,
        bottom: true,
        minimum: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Center(
                    child: Text('restaurantScreen'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
