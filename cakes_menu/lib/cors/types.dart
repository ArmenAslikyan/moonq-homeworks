import 'package:cakes_menu/cors/items.dart';
import 'package:cakes_menu/models/type.dart' as models;

final List<models.Type> types = [
  models.Type(chosen: true, text: 'Բոլորը', items: allItems),
  models.Type(chosen: false, text: 'Տորթեր', items: cakes),
  models.Type(chosen: false, text: 'Թխվածքաբլիթներ', items: cookies),
  models.Type(chosen: false, text: 'Շոկոլադներ', items: chocolates),
  models.Type(chosen: false, text: 'Հյութեր', items: juices),
];