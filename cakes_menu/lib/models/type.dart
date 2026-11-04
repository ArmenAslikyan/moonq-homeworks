import 'package:cakes_menu/models/item.dart';

class Type {
  Type(
    {
      required this.chosen,
      required this.text,
      required this.items
    }
  );
  bool chosen;
  final String text;
  final List<Item> items;
}