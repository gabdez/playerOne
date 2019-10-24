import 'package:flutter/material.dart';

import '../appTheme.dart';

class HotScreen extends StatefulWidget {
  HotScreen({Key key}) : super(key: key);

  @override
  _HotScreenState createState() => _HotScreenState();
}

class _HotScreenState extends State<HotScreen> {
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
                    child: Text('hotScreen'),
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
