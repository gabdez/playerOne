import 'package:flutter/material.dart';

import '../appTheme.dart';

class FamilleScreen extends StatefulWidget {
  FamilleScreen({Key key}) : super(key: key);

  @override
  _FamilleScreenState createState() => _FamilleScreenState();
}

class _FamilleScreenState extends State<FamilleScreen> {
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
                    child: Text('familleScreen'),
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
