import 'package:link_extractor/link_extractor.dart';
import 'package:test/test.dart';

void main() {
  group('OkruMatcher -', () {
    test('Can be initialized.', () {
      expect(OkruMatcher(), isNotNull);
    });

    test('Regex Pattern is not empty.', () {
      final matcher = OkruMatcher();
      expect(matcher.regex, isNotEmpty);
    });

    test('Returns null if the url does not match.', () async {
      final matcher = OkruMatcher();
      const wrongUrl = 'invalid_url';
      await expectLater(
        await matcher.match(wrongUrl),
        isNull,
      );
    });

    test('Returns Okru site if the url matches.', () async {
      final matcher = OkruMatcher();
      const validUrl = 'https://ok.ru/video/43134487273';
      await expectLater(
        await matcher.match(validUrl),
        isA<Okru>(),
      );
    });
  });
}
