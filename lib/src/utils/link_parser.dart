import 'package:link_extractor/src/matchers/matchers.dart';
import 'package:link_extractor/src/sites/sites.dart';

/// {@template link_parser}
/// Parses given url to appropriate site by using site matchers.
/// {@endtemplate}
class LinkParser {
  
  /// {@macro link_parser}
  const LinkParser(this.supportedSites);

  // Note : Using functions instead of objects for lazy initialization.
  /// Provides a list of all the supported sites by providing respective
  /// website matchers.
  final List<Matcher Function()> supportedSites;

  /// Tries to parse url to appropriate site.
  ///
  /// Throws [UnsupportedSiteException] if website is not supported.
  Future<Site> parse(String url) async {
    for (final matcher in supportedSites) {
      final site = await matcher().match(url);
      if (site != null) return site;
    }
    throw UnsupportedSiteException();
  }
}
