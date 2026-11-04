import 'package:library_management_system/models/book.dart';

class User{
  final String name;
  final String id;
  List<Book> takenBooks;
  User({
    required this.name,
    required this.id,
    required this.takenBooks
  });
}
