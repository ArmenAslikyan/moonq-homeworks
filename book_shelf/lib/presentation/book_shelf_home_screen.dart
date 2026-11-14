import 'package:book_shelf/core/books.dart';
import 'package:book_shelf/models/book.dart';
import 'package:book_shelf/models/genre.dart';
import 'package:book_shelf/presentation/book_details_screen.dart';
import 'package:book_shelf/presentation/widgets/book_tile.dart';
import 'package:book_shelf/presentation/widgets/genre_chip.dart';
import 'package:flutter/material.dart';

class BookShelfHomeScreen extends StatefulWidget {
  const BookShelfHomeScreen({super.key});

  @override
  State<BookShelfHomeScreen> createState() => _BookShelfHomeScreenState();
}

class _BookShelfHomeScreenState extends State<BookShelfHomeScreen> {
  List<Book> books = List.of(initialBooks);
  List<Book> shownBooks = List.of(initialBooks);
  final TextEditingController nameSearch = TextEditingController();
  Genre? _selectedGenre;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Կարդացված՝ $readCount / ${books.length}')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameSearch,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedGenre = null;
                    });
                    nameSearch.clear();
                    _refreshShownBooks();
                  },
                  icon: Icon(Icons.clear),
                ),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black12,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Որոնել անունով կամ հեղինակով',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: (_) => setState(_refreshShownBooks),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [null, ...Genre.values].map((genre) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GenreChip(
                      genre: genre,
                      selected: _selectedGenre == genre,
                      onSelected: (_) => _selectGenre(genre),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: shownBooks.isEmpty
                  ? const Center(child: Text('Ոչինչ չի գտնվել'))
                  : ListView.separated(
                      itemCount: shownBooks.length,
                      itemBuilder: (context, index) {
                        final book = shownBooks[index];
                        return Dismissible(
                          key: ValueKey(book.id),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (_) => _deleteBook(book),
                          child: BookTile(
                            book: book,
                            onToggleRead: () => _toggleRead(book),
                            onTap: () => _openDetails(book),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectGenre(Genre? genre) {
    setState(() {
      _selectedGenre = genre;
      _refreshShownBooks();
    });
  }

  void _refreshShownBooks() {
    final query = nameSearch.text.trim().toLowerCase();
    shownBooks = books.where((book) {
      final matchesGenre =
          _selectedGenre == null || book.genre == _selectedGenre;
      final matchesSearch =
          query.isEmpty ||
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesGenre && matchesSearch;
    }).toList();
  }

  void _toggleRead(Book book) {
    final index = books.indexWhere((item) => item.id == book.id);
    if (index == -1) return;
    setState(() {
      books[index] = book.copyWith(isRead: !book.isRead);
      _refreshShownBooks();
    });
  }

  Future<void> _openDetails(Book book) async {
    final rating = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (_) => BookDetailsScreen(book: book)),
    );
    if (!mounted || rating == null) return;
    final index = books.indexWhere((item) => item.id == book.id);
    if (index == -1) return;
    setState(() {
      books[index] = books[index].copyWith(rating: rating, isRead: true);
      _refreshShownBooks();
    });
  }

  void _deleteBook(Book book) {
    final originalIndex = books.indexWhere((item) => item.id == book.id);
    if (originalIndex == -1) return;
    setState(() {
      books.removeAt(originalIndex);
      _refreshShownBooks();
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('«${book.title}» ջնջվեց'),
          action: SnackBarAction(
            label: 'Վերադարձնել',
            onPressed: () {
              setState(() {
                final index = originalIndex.clamp(0, books.length);
                books.insert(index, book);
                _refreshShownBooks();
              });
            },
          ),
        ),
      );
  }

  int get readCount => books.where((book) => book.isRead).length;
}
