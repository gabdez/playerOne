import 'dart:async';

import 'package:flutter/material.dart';
import 'package:player_one/appTheme.dart';
import 'package:player_one/models/Soiree.dart';
import 'package:player_one/widgets/listJoueur.dart';

class SoireeScreen extends StatefulWidget {
  final Soiree soiree;
  SoireeScreen(this.soiree);

  @override
  _SoireeScreenState createState() => _SoireeScreenState();
}

class _SoireeScreenState extends State<SoireeScreen> {
  bool titleAnimation = true;
  bool listJoueurAnimation = true;
  bool btnAnimation = true;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      body: SafeArea(
        top: true,
        bottom: true,
        minimum: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                AnimatedContainer(
                  height: titleAnimation
                      ? 100
                      : MediaQuery.of(context).size.height / 5,
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                    opacity: titleAnimation ? 0 : 1,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: widget.soiree.name,
                          style: AppTheme.display1,
                        ),
                        TextSpan(text: "\n"),
                        TextSpan(
                          text: widget.soiree.description,
                          style: AppTheme.subtitleRed,
                        ),
                      ]),
                    ),
                  ),
                  duration: Duration(milliseconds: 500),
                ),
                Expanded(
                  child: Container(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                      opacity: listJoueurAnimation ? 0 : 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ListJoueur(),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: AnimatedAlign(
                    alignment:
                        btnAnimation ? Alignment.topRight : Alignment.center,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      opacity: btnAnimation ? 0 : 1,
                      child: FlatButton(
                        color: Colors.red[100],
                        child: Text('Lancer la soirée'),
                        onPressed: () {
                          lancerSoiree();
                        },
                      ),
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void lancerSoiree() {
    revertAnimation();
  }

  void startAnimation() {
    Timer(Duration(milliseconds: 200), () {
      setState(() {
        this.titleAnimation = false;
      });
    });

    Timer(Duration(milliseconds: 700), () {
      setState(() {
        this.listJoueurAnimation = false;
      });
    });

    Timer(Duration(milliseconds: 1300), () {
      setState(() {
        this.btnAnimation = false;
      });
    });
  }

  void revertAnimation() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        this.titleAnimation = true;
      });
    });

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        this.listJoueurAnimation = true;
      });
    });

    Timer(Duration(milliseconds: 0), () {
      setState(() {
        this.btnAnimation = true;
      });
    });
  }
}
