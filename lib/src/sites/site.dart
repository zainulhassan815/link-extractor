import 'package:http/http.dart' as http;
import 'package:link_extractor/src/models/models.dart';

/// {@template site}
/// Base class that every `Site` has to implement.
/// {@endTemplate}
abstract class Site {
  /// Home page url of the website. For e.g. https://www.youtube.com
  String get homeUrl;

  /// Extracts media urls from the given link. Returns a list of
  /// [ExtractedMedia]
  ///
  /// ```dart
  /// // Example Usage
  // ignore: lines_longer_than_80_chars
  /// final links = await extractor.extractUrls(client: myClient, url: 'my_url');
  /// print(links);
  /// ```
  Future<List<ExtractedMedia>> extractUrls({
    required http.Client client,
    required String url,
  });
}

/// Exception thrown if given url is not supported.
class UnsupportedSiteException implements Exception {}
