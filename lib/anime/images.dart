import 'dart:convert';

import 'jpg.dart';
import 'webp.dart';

class Images {
  Jpg? jpg;
  Webp? webp;

  Images({this.jpg, this.webp});

  @override
  String toString() => 'Images(jpg: $jpg, webp: $webp)';

  factory Images.fromMap(Map<String, dynamic> data) => Images(
        jpg: data['jpg'] == null
            ? null
            : Jpg.fromMap(data['jpg'] as Map<String, dynamic>),
        webp: data['webp'] == null
            ? null
            : Webp.fromMap(data['webp'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'jpg': jpg?.toMap(),
        'webp': webp?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Images].
  factory Images.fromJson(String data) {
    return Images.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Images] to a JSON string.
  String toJson() => json.encode(toMap());
}
