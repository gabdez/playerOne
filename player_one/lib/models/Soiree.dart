import 'package:flutter/material.dart';
import 'package:player_one/screens/familleScreen.dart';
import 'package:player_one/screens/hotScreen.dart';
import 'package:player_one/screens/restaurantScreen.dart';
import 'package:player_one/screens/soireeScreen.dart';

class Soiree {
  String name;
  String url;
  bool isLocked = true;
  double price = 1.99;
  Widget widget;

  Soiree(this.name, this.url, this.widget);
  Soiree.noLocked(this.name, this.url, this.widget) {
    this.name = name;
    this.url = url;
    this.isLocked = false;
    this.price = 0.0;
    this.widget = widget;
  }

  static List<Soiree> getAllSoiree() {
    return [
      Soiree.noLocked(
          "En famille", "assets/images/famille.jpeg", FamilleScreen()),
      Soiree.noLocked(
          "En soirée", "assets/images/soireeAmis.jpeg", SoireeScreen()),
      Soiree(
          "Au restaurant", "assets/images/restaurant.jpeg", RestaurantScreen()),
      Soiree("Hot +18", "assets/images/hot.jpeg", HotScreen()),
    ];
  }
}
