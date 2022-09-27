import 'dart:convert';

class Studio {
  int? malId;
  String? type;
  String? name;
  String? url;

  Studio({this.malId, this.type, this.name, this.url});

  @override
  String toString() {
    return 'Studio(malId: $malId, type: $type, name: $name, url: $url)';
  }

  factory Studio.fromMap(Map<String, dynamic> data) => Studio(
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
  /// Parses the string and returns the resulting Json object as [Studio].
  factory Studio.fromJson(String data) {
    return Studio.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Studio] to a JSON string.
  String toJson() => json.encode(toMap());
}
