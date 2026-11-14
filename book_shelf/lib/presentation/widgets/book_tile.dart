import 'package:book_shelf/models/book.dart';
import 'package:book_shelf/presentation/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile({
    super.key,
    required this.book,
    required this.onToggleRead,
    required this.onTap,
  });

  final Book book;
  final VoidCallback onToggleRead;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Checkbox(value: book.isRead, onChanged: (_) => onToggleRead()),
      title: Text(
        book.title,
        style: TextStyle(
          decoration: book.isRead ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text('${book.author} • ${book.genre.name}'),
      trailing: book.rating == null ? null : RatingStars(rating: book.rating!),
    );
  }
}
