class Soiree {
  String name;
  String url;
  bool isLocked = true;

  Soiree(this.name, this.url);
  Soiree.noLocked(this.name, this.url) {
    this.name = name;
    this.url = url;
    this.isLocked = false;
  }

  static List<Soiree> getAllSoiree() {
    return [
      Soiree.noLocked("En famille", "assets/images/famille.jpeg"),
      Soiree("Au restaurant", "assets/images/restaurant.jpeg"),
      Soiree("En soirée", "assets/images/soireeAmis.jpeg"),
      Soiree("Hot +18", "assets/images/hot.jpeg"),
    ];
  }
}
