class Halwa {
  String name;
  String image;
  String price;
  String rating;
  String description;

  Halwa(
      {required this.name,
      required this.image,
      required this.price,
      required this.rating
      ,required this.description
      });

  String get getName => name;
  String get getImage => image;
  String get getPrice => price;
  String get getRating => rating;
  String get getDescription => description;
}
