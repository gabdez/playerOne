import 'package:flutter/material.dart';
import 'package:player_one/models/Soiree.dart';

class CardSoiree extends StatelessWidget {
  final Soiree soiree;
  final bool multiple;
  final TapCallback callback;
  CardSoiree(this.soiree, this.multiple, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment(0, 0),
              child: Image.asset(
                soiree.url,
                fit: BoxFit.cover,
              ),
            ),
            soiree.isLocked
                ? Container(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 4),
                      alignment: Alignment(1, -1),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.lock,
                            size: !multiple ? 30 : 20,
                            color: Colors.red[100],
                          ),
                          Text(
                            soiree.price.toString() + "€",
                            style:
                                TextStyle(color: Colors.red[100], fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  )
                : SizedBox(),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                onTap: () {
                  this.callback(soiree);
                },
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      soiree.name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  height: 30,
                  alignment: Alignment(0.0, 1.0)),
            ),
          ],
        ),
      ),
    );
  }
}

typedef TapCallback = void Function(Soiree soiree);
