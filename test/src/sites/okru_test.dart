import 'package:http/http.dart';
import 'package:link_extractor/link_extractor.dart';
import 'package:test/test.dart';

void main() {
  group('OkruTest -', () {
    late Okru okru;
    late Client client;

    setUp(() {
      okru = Okru();
      client = Client();
    });

    tearDown(() {
      client.close();
    });

    test('Can be initialized', () {
      expect(okru, isNotNull);
    });

    test('Home url is not empty.', () {
      expect(okru.homeUrl, isNotEmpty);
    });

    test('Throws exception if url is not valid.', () {
      const wrongUrl = 'https://invalidUrl';
      expectLater(
        okru.extractUrls(
          client: client,
          url: wrongUrl,
        ),
        throwsException,
      );
    });

    test(
      'Returns List of ExtractedMedia if a valid url is provided.',
      () async {
        const validUrl = 'https://ok.ru/video/43134487273';
        await expectLater(
          await okru.extractUrls(
            client: client,
            url: validUrl,
          ),
          isA<List<ExtractedMedia>>(),
        );
      },
    );
  });
}
