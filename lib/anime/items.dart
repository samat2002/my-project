import 'dart:convert';

class Items {
  int? count;
  int? total;
  int? perPage;

  Items({this.count, this.total, this.perPage});

  @override
  String toString() {
    return 'Items(count: $count, total: $total, perPage: $perPage)';
  }

  factory Items.fromMap(Map<String, dynamic> data) => Items(
        count: data['count'] as int?,
        total: data['total'] as int?,
        perPage: data['per_page'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'total': total,
        'per_page': perPage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Items].
  factory Items.fromJson(String data) {
    return Items.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Items] to a JSON string.
  String toJson() => json.encode(toMap());
}
