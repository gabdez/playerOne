import 'package:flutter/material.dart';
import 'package:player_one/models/Soiree.dart';

class CardSoiree extends StatelessWidget {
  final Soiree soiree;
  final bool multiple;
  CardSoiree(this.soiree, this.multiple);

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
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment(1, -1),
                      child: Icon(
                        Icons.lock,
                        size: !multiple ? 40 : 20,
                        color: Colors.red[100],
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
                  if (soiree.isLocked) {
                    print('is locked');
                  } else {
                    print('is not locked');
                  }
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
