import 'dart:convert';

import 'images.dart';

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;
  Images? images;

  Trailer({this.youtubeId, this.url, this.embedUrl, this.images});

  @override
  String toString() {
    return 'Trailer(youtubeId: $youtubeId, url: $url, embedUrl: $embedUrl, images: $images)';
  }

  factory Trailer.fromMap(Map<String, dynamic> data) => Trailer(
        youtubeId: data['youtube_id'] as String?,
        url: data['url'] as String?,
        embedUrl: data['embed_url'] as String?,
        images: data['images'] == null
            ? null
            : Images.fromMap(data['images'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'youtube_id': youtubeId,
        'url': url,
        'embed_url': embedUrl,
        'images': images?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Trailer].
  factory Trailer.fromJson(String data) {
    return Trailer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Trailer] to a JSON string.
  String toJson() => json.encode(toMap());
}
