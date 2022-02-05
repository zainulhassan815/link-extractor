import 'package:http/http.dart' as http;
import 'package:link_extractor/src/matchers/matchers.dart';
import 'package:link_extractor/src/models/models.dart';
import 'package:link_extractor/src/utils/utils.dart';

/// {@template link_extractor}
/// A Simple utility for extracting media urls from different websites.
/// {@endtemplate}
class LinkExtractor {
  /// {@macro link_extractor}
  LinkExtractor([
    http.Client? httpClient,
  ]) : _client = httpClient ?? http.Client() {
    _registerSites();
  }

  final http.Client _client;
  late LinkParser _linkParser;

  /// Register all the websites matchers.
  void _registerSites() {
    final supportedSites = [
      () => OkruMatcher(),
    ];
    _linkParser = LinkParser(supportedSites);
  }

  /// Tries to extract media sources from given url.
  ///
  /// Throws `UnsupportedSiteException` if website is not supported.
  ///
  /// ```dart
  /// // Example Usage
  /// final extractor = LinkExtractor();
  /// final links = await extractor.extract('my_url');
  /// print(links);
  /// ```
  Future<List<ExtractedMedia>> extract(String url) async {
    final site = await _linkParser.parse(url);
    return site.extractUrls(client: _client, url: url);
  }

  /// Dispose all the resources (usually [http.Client]) being used by
  /// the [LinkExtractor]
  ///
  /// Please note that if you have provided a [http.Client] and don't want to
  /// dispose it yet, then you should not call [dispose] method
  /// on [LinkExtractor]
  void dispose() {
    _client.close();
  }
}
