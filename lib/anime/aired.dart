import 'dart:convert';

import 'prop.dart';

class Aired {
  String? from;
  String? to;
  Prop? prop;
  String? string;

  Aired({this.from, this.to, this.prop, this.string});

  @override
  String toString() {
    return 'Aired(from: $from, to: $to, prop: $prop, string: $string)';
  }

  factory Aired.fromMap(Map<String, dynamic> data) => Aired(
        from: data['from'] as String?,
        to: data['to'] as String?,
        prop: data['prop'] == null
            ? null
            : Prop.fromMap(data['prop'] as Map<String, dynamic>),
        string: data['string'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'from': from,
        'to': to,
        'prop': prop?.toMap(),
        'string': string,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Aired].
  factory Aired.fromJson(String data) {
    return Aired.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Aired] to a JSON string.
  String toJson() => json.encode(toMap());
}
