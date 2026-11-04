import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:akinator/domain/i_character_image_repo.dart';

class CharacterImageRepo implements ICharacterImageRepo {
  static final Uri _apiUrl = Uri.parse('https://hp-api.onrender.com/api/characters');
  List<dynamic>? _cachedCharacters;

  CharacterImageRepo();

  @override
  Future<String?> getImageUrl(String characterName) async {
    try {
      _cachedCharacters ??= await _fetchCharacters();
      if (_cachedCharacters == null) return null;

      final targetName = characterName.toLowerCase().trim();
      for (final item in _cachedCharacters!) {
        if (item is Map<String, dynamic>) {
          final name = item['name']?.toString().toLowerCase().trim();
          if (name == targetName) {
            final imageUrl = item['image']?.toString();
            if (imageUrl != null && imageUrl.isNotEmpty) {
              return imageUrl;
            }
          }
        }
      }
    } catch (_) {}
    return null;
  }

  Future<List<dynamic>?> _fetchCharacters() async {
    try {
      final response = await http.get(_apiUrl);
      if (response.statusCode == 200) {
        return json.decode(response.body) as List<dynamic>;
      }
    } catch (_) {}
    return null;
  }
}
