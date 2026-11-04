import 'package:library_management_system/models/book.dart';
import 'package:library_management_system/models/user.dart';

abstract interface class IBooksRepo{
  void addBook(Book book);
  List<Book> getAvailableBooks();
  Book searchBook(String name, String author);
  bool showStatus(Book book);
  void borrowBook(Book book, User user);
  void returnBook(Book book, User user);
}
