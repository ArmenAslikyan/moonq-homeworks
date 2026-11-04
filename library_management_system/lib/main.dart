import 'package:library_management_system/infrastructure/books_repo.dart';
import 'package:library_management_system/infrastructure/users_repo.dart';
import 'package:library_management_system/models/book.dart';
import 'package:library_management_system/models/libarary.dart';
import 'package:library_management_system/models/user.dart';
import 'package:library_management_system/services/open_library_service.dart';

Future<void> main() async {
  final booksRepo = BooksRepo();
  final usersRepo = UsersRepo();
  final openLibraryService = OpenLibraryService();

  final book1 = Book(
    title: '1984',
    author: 'George Orwell',
    year: 1949,
    isBorrowed: false,
  );
  final book2 = Book(
    title: 'The Hobbit',
    author: 'J. R. R. Tolkien',
    year: 1937,
    isBorrowed: false,
  );
  final book3 = Book(
    title: 'Dune',
    author: 'Frank Herbert',
    year: 1965,
    isBorrowed: false,
  );

  final user1 = User(name: 'Ani', id: 'U-001', takenBooks: []);
  final user2 = User(name: 'Aram', id: 'U-002', takenBooks: []);

  final library = Library(books: [book1, book2, book3], users: [user1, user2]);

  for (final book in library.books) {
    booksRepo.addBook(book);
  }
  for (final user in library.users) {
    usersRepo.addUser(user);
  }

  print('=== Initial library lists ===');
  _printBooks('All books', library.books);
  _printUsers('All users', library.users);
  _printBooks('Available books', booksRepo.getAvailableBooks());

  final foundBook = booksRepo.searchBook('1984', 'George Orwell');
  print('\nLocal Search result: ${foundBook.title} by ${foundBook.author}');

  print('\n=== Fetching Books online from Open Library Search API ===');
  try {
    print('Searching Open Library for "Harry Potter"...');
    final apiBooks = await openLibraryService.searchBooks('Harry Potter', limit: 3);
    
    _printBooks('Fetched from Open Library API', apiBooks);

    // Add fetched books into our local repository & library
    for (final apiBook in apiBooks) {
      booksRepo.addBook(apiBook);
      library.books.add(apiBook);
    }
    print('\nAdded fetched books to local library repo!');
    _printBooks('Updated Local Available Books', booksRepo.getAvailableBooks());
  } catch (e) {
    print('Failed to fetch books from Open Library API: $e');
  }

  print('\n=== Borrow checks ===');
  print('Ani borrows 1984: ${_borrowBook(booksRepo, user1, book1)}');
  print(
    'Aram tries to borrow 1984 again: ${_borrowBook(booksRepo, user2, book1)}',
  );
  print('1984 is borrowed: ${booksRepo.showStatus(book1)}');
  _printBooks('Available books after borrowing', booksRepo.getAvailableBooks());
  _printBooks('Ani borrowed books', usersRepo.borrowedBooks(user1));
  _printBooks('Aram borrowed books', usersRepo.borrowedBooks(user2));

  print('\n=== Return checks ===');
  print(
    'Aram tries to return Ani\'s book: ${_returnBook(booksRepo, user2, book1)}',
  );
  print('Ani returns 1984: ${_returnBook(booksRepo, user1, book1)}');
  print('1984 is borrowed: ${booksRepo.showStatus(book1)}');
  _printBooks('Available books after returning', booksRepo.getAvailableBooks());
  _printBooks('Ani borrowed books', usersRepo.borrowedBooks(user1));
}

bool _borrowBook(BooksRepo booksRepo, User user, Book book) {
  if (book.isBorrowed) {
    return false;
  }

  booksRepo.borrowBook(book, user);
  book.isBorrowed = true;
  return true;
}

bool _returnBook(BooksRepo booksRepo, User user, Book book) {
  if (!user.takenBooks.contains(book)) {
    return false;
  }

  booksRepo.returnBook(book, user);
  book.isBorrowed = false;
  return true;
}

void _printBooks(String title, List<Book> books) {
  print('\n$title:');
  if (books.isEmpty) {
    print('  No books.');
    return;
  }

  for (final book in books) {
    print(
      '  - ${book.title} by ${book.author} (${book.year}), '
      'borrowed: ${book.isBorrowed}',
    );
  }
}

void _printUsers(String title, List<User> users) {
  print('\n$title:');
  if (users.isEmpty) {
    print('  No users.');
    return;
  }

  for (final user in users) {
    final takenTitles = user.takenBooks.isEmpty
        ? 'no books'
        : user.takenBooks.map((book) => book.title).join(', ');
    print('  - ${user.name} (${user.id}): $takenTitles');
  }
}
