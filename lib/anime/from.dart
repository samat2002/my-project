import 'dart:convert';

class From {
  int? day;
  int? month;
  int? year;

  From({this.day, this.month, this.year});

  @override
  String toString() => 'From(day: $day, month: $month, year: $year)';

  factory From.fromMap(Map<String, dynamic> data) => From(
        day: data['day'] as int?,
        month: data['month'] as int?,
        year: data['year'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'day': day,
        'month': month,
        'year': year,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [From].
  factory From.fromJson(String data) {
    return From.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [From] to a JSON string.
  String toJson() => json.encode(toMap());
}
