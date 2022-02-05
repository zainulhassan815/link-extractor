import 'package:link_extractor/link_extractor.dart';
import 'package:test/test.dart';

void main() {
  final supportedSites = [
    () => OkruMatcher(),
  ];

  late LinkParser linkParser;

  setUp(() {
    linkParser = LinkParser(supportedSites);
  });

  group('LinkParserTest -', () {
    test('Can be initialized.', () {
      expect(linkParser, isNotNull);
    });

    test('Throws UnsupportedSiteException if url is not valid.', () {
      const wrongUrl = 'invalid_url';
      expectLater(
        linkParser.parse(wrongUrl),
        throwsA(isA<UnsupportedSiteException>()),
      );
    });

    test('Return Site if a url is valid.', () async {
      const validUrl = 'https://ok.ru/video/43134487273';
      await expectLater(
        await linkParser.parse(validUrl),
        isA<Okru>(),
      );
    });
  });
}
