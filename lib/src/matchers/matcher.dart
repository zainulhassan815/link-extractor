import 'package:link_extractor/src/sites/site.dart';

/// A utitlity class that matches url for a specific website.
abstract class Matcher {
  /// A regex string that will be used to match given url.
  String get regex;

  /// Tries to match the given url. Returns matched site if match is successfull
  /// else null.
  Future<Site?> match(String url);
}
