import 'package:equatable/equatable.dart';

/// {@template extracted_url}
/// A data class representing `url` and its `quality`
/// {@endtemplate}
class ExtractedMedia extends Equatable {
  /// {@macro extracted_url}
  const ExtractedMedia({
    required this.url,
    required this.quality,
  });

  /// The url of the media file
  final String url;

  /// The quality of the media file
  final String quality;

  @override
  List<Object?> get props => [url, quality];
  
  @override
  bool? get stringify => true;
}
