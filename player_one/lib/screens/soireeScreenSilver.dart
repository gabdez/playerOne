import 'dart:async';

import 'package:flutter/material.dart';
import 'package:player_one/appTheme.dart';
import 'package:player_one/models/Soiree.dart';

class SoireeScreenSilver extends StatefulWidget {
  final Soiree soiree;
  SoireeScreenSilver(this.soiree);

  @override
  _SoireeScreenSilverState createState() => _SoireeScreenSilverState();
}

class _SoireeScreenSilverState extends State<SoireeScreenSilver>
    with TickerProviderStateMixin {
  AnimationController animationController;
  bool titleAnimation = true;
  bool listJoueurAnimation = true;

  @override
  void initState() {
    Timer(Duration(milliseconds: 0), () {
      setState(() {
        print(this.titleAnimation);
        this.titleAnimation = false;
        print(this.titleAnimation);
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        print(this.listJoueurAnimation);
        this.listJoueurAnimation = false;
        print(this.listJoueurAnimation);
      });
    });

    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppTheme.nearlyWhite,
            leading: null,
            elevation: 0,
            pinned: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.soiree.name,
                    style: AppTheme.headline,
                  ),
                  TextSpan(
                    text: "\n",
                  ),
                  TextSpan(
                    text: widget.soiree.description,
                    style: AppTheme.subtitleRed,
                  ),
                ]),
              ),
            ),
          ),
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
              (context, index) => ListTile(title: Text('Item #$index')),
              // Builds 1000 ListTiles
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
