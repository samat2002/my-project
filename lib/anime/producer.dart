import 'dart:convert';

class Producer {
  int? malId;
  String? type;
  String? name;
  String? url;

  Producer({this.malId, this.type, this.name, this.url});

  @override
  String toString() {
    return 'Producer(malId: $malId, type: $type, name: $name, url: $url)';
  }

  factory Producer.fromMap(Map<String, dynamic> data) => Producer(
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
  /// Parses the string and returns the resulting Json object as [Producer].
  factory Producer.fromJson(String data) {
    return Producer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Producer] to a JSON string.
  String toJson() => json.encode(toMap());
}
