import 'dart:convert';

class Broadcast {
  String? day;
  String? time;
  String? timezone;
  String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  @override
  String toString() {
    return 'Broadcast(day: $day, time: $time, timezone: $timezone, string: $string)';
  }

  factory Broadcast.fromMap(Map<String, dynamic> data) => Broadcast(
        day: data['day'] as String?,
        time: data['time'] as String?,
        timezone: data['timezone'] as String?,
        string: data['string'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'day': day,
        'time': time,
        'timezone': timezone,
        'string': string,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Broadcast].
  factory Broadcast.fromJson(String data) {
    return Broadcast.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Broadcast] to a JSON string.
  String toJson() => json.encode(toMap());
}
