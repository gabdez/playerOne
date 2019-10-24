import 'package:flutter/material.dart';

import '../appTheme.dart';

class EntreAmisScreen extends StatefulWidget {
  EntreAmisScreen({Key key}) : super(key: key);

  @override
  _EntreAmisScreenState createState() => _EntreAmisScreenState();
}

class _EntreAmisScreenState extends State<EntreAmisScreen> {
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
