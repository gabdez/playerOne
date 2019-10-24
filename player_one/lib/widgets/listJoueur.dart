import 'package:flutter/material.dart';

class ListJoueur extends StatefulWidget {
  ListJoueur({Key key}) : super(key: key);

  @override
  _ListJoueurState createState() => _ListJoueurState();
}

class _ListJoueurState extends State<ListJoueur> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: false,
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 45,
            color: Colors.blueGrey,
          ),
          title: Text('item $index'),
        );
      },
    );
  }
}
