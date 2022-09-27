import 'dart:convert';

import 'from.dart';
import 'to.dart';

class Prop {
  From? from;
  To? to;

  Prop({this.from, this.to});

  @override
  String toString() => 'Prop(from: $from, to: $to)';

  factory Prop.fromMap(Map<String, dynamic> data) => Prop(
        from: data['from'] == null
            ? null
            : From.fromMap(data['from'] as Map<String, dynamic>),
        to: data['to'] == null
            ? null
            : To.fromMap(data['to'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'from': from?.toMap(),
        'to': to?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Prop].
  factory Prop.fromJson(String data) {
    return Prop.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Prop] to a JSON string.
  String toJson() => json.encode(toMap());
}
