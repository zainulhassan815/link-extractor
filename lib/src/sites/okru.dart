import 'dart:convert';

import 'package:html_character_entities/html_character_entities.dart';
import 'package:http/http.dart' as http;
import 'package:link_extractor/src/models/models.dart';
import 'package:link_extractor/src/sites/sites.dart';

/// Site implementation for https://ok.ru/
class Okru extends Site {
  @override
  String get homeUrl => 'https://ok.ru/';

  @override
  Future<List<ExtractedMedia>> extractUrls({
    required http.Client client,
    required String url,
  }) async {
    final response = await client.get(Uri.parse(url));
    if (response.body.isNotEmpty && response.statusCode == 200) {
      final htmlDecoded = HtmlCharacterEntities.decode(response.body)
          .replaceAll(' ', '')
          .replaceAll(r'\\\', '')
          .replaceAll(r'\\u0026amp;', '&')
          .replaceAll(r'\\u0026', '&');
      final jsonRegex = RegExp(r'(videos\b).*(metadataEmbedded\b)');
      final jsonMatch = jsonRegex.firstMatch(htmlDecoded);
      final jsonString = jsonMatch
          ?.group(0)
          ?.replaceAll(r'videos\":', '"')
          .replaceAll(r',\"metadataEmbedded', '"');
      final videosString = jsonDecode(jsonString ?? '[]') as String?;
      if (videosString != null) {
        final result = (jsonDecode(videosString) as List<dynamic>).map(
          (dynamic json) {
            final obj = jsonDecode(jsonEncode(json)) as Map<String, dynamic>;
            return ExtractedMedia(
              url: obj['url'] as String,
              quality: obj['name'] as String,
            );
          },
        ).toList();
        return result;
      }
    }
    return [];
  }
}
