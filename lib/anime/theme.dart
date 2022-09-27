import 'dart:convert';

class Theme {
  int? malId;
  String? type;
  String? name;
  String? url;

  Theme({this.malId, this.type, this.name, this.url});

  @override
  String toString() {
    return 'Theme(malId: $malId, type: $type, name: $name, url: $url)';
  }

  factory Theme.fromMap(Map<String, dynamic> data) => Theme(
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
  /// Parses the string and returns the resulting Json object as [Theme].
  factory Theme.fromJson(String data) {
    return Theme.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Theme] to a JSON string.
  String toJson() => json.encode(toMap());
}
