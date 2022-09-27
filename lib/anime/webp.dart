import 'dart:convert';

class Webp {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Webp({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  @override
  String toString() {
    return 'Webp(imageUrl: $imageUrl, smallImageUrl: $smallImageUrl, largeImageUrl: $largeImageUrl)';
  }

  factory Webp.fromMap(Map<String, dynamic> data) => Webp(
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
  /// Parses the string and returns the resulting Json object as [Webp].
  factory Webp.fromJson(String data) {
    return Webp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Webp] to a JSON string.
  String toJson() => json.encode(toMap());
}
