import 'dart:convert';

class Licensor {
  int? malId;
  String? type;
  String? name;
  String? url;

  Licensor({this.malId, this.type, this.name, this.url});

  @override
  String toString() {
    return 'Licensor(malId: $malId, type: $type, name: $name, url: $url)';
  }

  factory Licensor.fromMap(Map<String, dynamic> data) => Licensor(
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
  /// Parses the string and returns the resulting Json object as [Licensor].
  factory Licensor.fromJson(String data) {
    return Licensor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Licensor] to a JSON string.
  String toJson() => json.encode(toMap());
}
