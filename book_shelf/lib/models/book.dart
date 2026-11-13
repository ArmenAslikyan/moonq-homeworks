import 'package:book_shelf/models/genre.dart';

class Book{
  final int id;
  final String title;
  final String author;
  final Genre genre;
  final bool isRead;
  final int? rating;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    this.isRead = false,
    this.rating,
  });

  
}
