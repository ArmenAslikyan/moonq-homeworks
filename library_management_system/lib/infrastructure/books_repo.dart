import 'package:library_management_system/domain/i_books_repo.dart';
import 'package:library_management_system/models/book.dart';
import 'package:library_management_system/models/user.dart';

class BooksRepo implements IBooksRepo {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => !book.isBorrowed).toList();
  }
  Book searchBook(String name, String author){
    return _books.firstWhere((book) => book.title == name && book.author == author);
  }
  bool showStatus(Book book){
    return book.isBorrowed;
  }
  void borrowBook(Book book, User user) {
    int index = _books.indexWhere((item) => item == book);
    if (index != -1) {
      _books.removeAt(index);
      }
    user.takenBooks.add(book);
  }
  void returnBook(Book book, User user){
    _books.add(book);
    int index = user.takenBooks.indexWhere((item) => item == book);
    if (index != -1) {
      user.takenBooks.removeAt(index);
    }
  }

}
