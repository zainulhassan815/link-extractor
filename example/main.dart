// ignore_for_file: avoid_print

import 'package:link_extractor/link_extractor.dart';

Future<void> main(List<String> args) async {
  try {
    final extractor = LinkExtractor();
    final links = await extractor.extract(
      'https://ok.ru/video/43134487273',
    );
    extractor.dispose();
    print(links);
  } on UnsupportedSiteException catch (e) {
    print('Website not supported. { error : $e }');
  }
}
