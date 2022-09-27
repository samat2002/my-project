import 'dart:convert';

class Genre {
  int? malId;
  String? type;
  String? name;
  String? url;

  Genre({this.malId, this.type, this.name, this.url});

  @override
  String toString() {
    return 'Genre(malId: $malId, type: $type, name: $name, url: $url)';
  }

  factory Genre.fromMap(Map<String, dynamic> data) => Genre(
        malId: data['mal_id'] as int?,
        type: data['type'] as String?,
        name: data['name'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'mal_id': malId,
        'type': type,
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Genre].
  factory Genre.fromJson(String data) {
    return Genre.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Genre] to a JSON string.
  String toJson() => json.encode(toMap());
}
