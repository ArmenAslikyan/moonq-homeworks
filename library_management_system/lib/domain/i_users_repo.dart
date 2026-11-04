import 'package:library_management_system/models/book.dart';
import 'package:library_management_system/models/user.dart';

abstract interface class IUsersRepo{
  void addUser(User user);
  List<Book> borrowedBooks(User user);
}
