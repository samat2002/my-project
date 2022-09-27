import 'dart:convert';

class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  @override
  String toString() {
    return 'Jpg(imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, largeImageUrl: $largeImageUrl)';
  }

  factory Jpg.fromMap(Map<String, dynamic> data) => Jpg(
        imageUrl: data['image_url'] as String?,
        smallImageUrl: data['small_image_url'] as String?,
        largeImageUrl: data['large_image_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'image_url': imageUrl,
        'small_image_url': smallImageUrl,
        'large_image_url': largeImageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Jpg].
  factory Jpg.fromJson(String data) {
    return Jpg.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Jpg] to a JSON string.
  String toJson() => json.encode(toMap());
}
