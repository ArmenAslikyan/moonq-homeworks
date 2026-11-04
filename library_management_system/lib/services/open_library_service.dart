import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_management_system/models/book.dart';

/// Service responsible for fetching book data from Open Library API.
class OpenLibraryService {
  static const String _baseUrl = 'https://openlibrary.org/search.json';

  /// Searches Open Library by query string and returns a list of [Book] objects.
  Future<List<Book>> searchBooks(String query, {int limit = 5}) async {
    final url = Uri.parse('$_baseUrl?q=${Uri.encodeComponent(query)}&limit=$limit');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> docs = data['docs'] ?? [];

      return docs.map((doc) {
        final title = doc['title'] as String? ?? 'Unknown Title';
        
        final authorsList = doc['author_name'] as List<dynamic>?;
        final author = (authorsList != null && authorsList.isNotEmpty)
            ? authorsList.first as String
            : 'Unknown Author';

        final year = doc['first_publish_year'] as int? ?? 0;

        return Book(
          title: title,
          author: author,
          year: year,
          isBorrowed: false,
        );
      }).toList();
    } else {
      throw Exception('Failed to load books from Open Library API (HTTP status ${response.statusCode})');
    }
  }
}
