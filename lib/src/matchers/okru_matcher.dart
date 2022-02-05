import 'package:link_extractor/src/matchers/matcher.dart';
import 'package:link_extractor/src/sites/okru.dart';

/// A matcher implementation for https://ok.ru
class OkruMatcher extends Matcher {
  @override
  Future<Okru?> match(String url) async {
    final hasMatch = RegExp(regex).hasMatch(url);
    return hasMatch ? Okru() : null;
  }

  @override
  String get regex =>
      r'^((?:https?:)?\/\/)?((?:www)\.)?((ok\.ru))\/([a-z]+)\/([0-9]+)';
}
