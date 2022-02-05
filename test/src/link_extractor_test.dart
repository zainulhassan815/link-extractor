// ignore_for_file: prefer_const_constructors
import 'package:link_extractor/link_extractor.dart';
import 'package:test/test.dart';

void main() {
  group('LinkExtractor', () {
    late LinkExtractor extractor;

    setUp(() {
      extractor = LinkExtractor();
    });

    tearDown(() {
      extractor.dispose();
    });

    test('can be instantiated', () {
      expect(extractor, isNotNull);
    });

    test(
      'Should throw exception if the given url is not supported',
      () async {
        const wrongUrl = 'invalid_url';
        await expectLater(
          extractor.extract(wrongUrl),
          throwsA(isA<UnsupportedSiteException>()),
        );
      },
    );

    test(
      'If LinkExtractor is used after disposing, should throw exception',
      () {
        extractor.dispose();
        expect(extractor.extract(''), throwsException);
      },
    );
  });
}
