import 'package:book_shelf/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.book});

  final Book book;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late int _rating = widget.book.rating ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Գրքի տվյալներ')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.book.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text('Հեղինակ՝ ${widget.book.author}'),
            Text('Ժանր՝ ${widget.book.genre.name}'),
            const SizedBox(height: 24),
            Row(
              children: List.generate(
                5,
                (index) => IconButton(
                  onPressed: () => setState(() => _rating = index + 1),
                  icon: Icon(index < _rating ? Icons.star : Icons.star_border),
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _rating == 0
                  ? null
                  : () => Navigator.pop(context, _rating),
              child: const Text('Պահպանել'),
            ),
          ],
        ),
      ),
    );
  }
}
