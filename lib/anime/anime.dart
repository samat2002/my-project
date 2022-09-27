import 'dart:convert';

import 'datum.dart';
import 'pagination.dart';

class Anime {
  Pagination? pagination;
  List<Datum>? data;

  Anime({this.pagination, this.data});

  @override
  String toString() => 'Anime(pagination: $pagination, data: $data)';

  factory Anime.fromMap(Map<String, dynamic> data) => Anime(
        pagination: data['pagination'] == null
            ? null
            : Pagination.fromMap(data['pagination'] as Map<String, dynamic>),
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'pagination': pagination?.toMap(),
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Anime].
  factory Anime.fromJson(String data) {
    return Anime.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Anime] to a JSON string.
  String toJson() => json.encode(toMap());
}
