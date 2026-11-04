import 'package:library_management_system/domain/i_users_repo.dart';
import 'package:library_management_system/models/book.dart';
import 'package:library_management_system/models/user.dart';

class UsersRepo implements IUsersRepo{
  final List<User> _users = [];
  void addUser(User user){
    _users.add(user);
  }
  List<Book> borrowedBooks(User user){
    return user.takenBooks;
  }
}
