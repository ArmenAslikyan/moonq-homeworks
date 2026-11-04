import 'package:library_management_system/models/book.dart';
import 'package:library_management_system/models/user.dart';

class Library{
  List<Book> books;
  List<User> users;
  Library({
    required this.books,
    required this.users
  });
}
