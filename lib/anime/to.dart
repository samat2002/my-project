import 'dart:convert';

class To {
  int? day;
  int? month;
  int? year;

  To({this.day, this.month, this.year});

  @override
  String toString() => 'To(day: $day, month: $month, year: $year)';

  factory To.fromMap(Map<String, dynamic> data) => To(
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
  /// Parses the string and returns the resulting Json object as [To].
  factory To.fromJson(String data) {
    return To.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [To] to a JSON string.
  String toJson() => json.encode(toMap());
}
