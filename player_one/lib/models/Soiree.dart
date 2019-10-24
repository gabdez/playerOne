import 'package:flutter/material.dart';
import 'package:player_one/models/Joueur.dart';
import 'package:player_one/screens/entreamisScreen.dart';
import 'package:player_one/screens/familleScreen.dart';
import 'package:player_one/screens/hotScreen.dart';
import 'package:player_one/screens/restaurantScreen.dart';

class Soiree {
  String name;
  String url;
  String description;
  bool isLocked = true;
  double price = 1.99;
  Widget widget;
  List<Joueur> joueurs;

  Soiree(this.name, this.url, this.widget, this.description);
  Soiree.noLocked(this.name, this.url, this.widget, this.description) {
    this.name = name;
    this.url = url;
    this.isLocked = false;
    this.price = 0.0;
    this.widget = widget;
    this.description = description;
  }

  static List<Soiree> getAllSoiree() {
    return [
      Soiree.noLocked("En famille", "assets/images/famille.jpeg",
          FamilleScreen(), "Prêt à défier votre grand-mère à Player One ?"),
      Soiree.noLocked("En soirée", "assets/images/soireeAmis.jpeg",
          EntreAmisScreen(), "Prêt à animer votre soirée avec Player One ?"),
      Soiree("Au restaurant", "assets/images/restaurant.jpeg",
          RestaurantScreen(), "Prêt à faire payer l'addition au perdant ?"),
      Soiree("Hot +18", "assets/images/hot.jpeg", HotScreen(),
          "Prêt à mettre du piment++ dans votre soirée ?"),
    ];
  }
}
