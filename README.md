# Link Extractor

A Simple utility for extracting media urls from differennt social media websites.

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link] [![License: MIT][license_badge]][license_link]

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

---

## Supported Websites

1. Ok.ru

## Baic Usage

```dart
import 'package:link_extractor/link_extractor.dart';

try {
    final extractor = LinkExtractor();
    final links = await extractor.extract(
      'https://ok.ru/video/43134487273',
    );
    extractor.dispose();
    print(links);
} on UnsupportedSiteException (e) {
    print('Website not supported. { error : $e }');
}
```
