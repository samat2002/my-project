import 'dart:convert';

import 'items.dart';

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  @override
  String toString() {
    return 'Pagination(lastVisiblePage: $lastVisiblePage, hasNextPage: $hasNextPage, currentPage: $currentPage, items: $items)';
  }

  factory Pagination.fromMap(Map<String, dynamic> data) => Pagination(
        lastVisiblePage: data['last_visible_page'] as int?,
        hasNextPage: data['has_next_page'] as bool?,
        currentPage: data['current_page'] as int?,
        items: data['items'] == null
            ? null
            : Items.fromMap(data['items'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'last_visible_page': lastVisiblePage,
        'has_next_page': hasNextPage,
        'current_page': currentPage,
        'items': items?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pagination].
  factory Pagination.fromJson(String data) {
    return Pagination.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pagination] to a JSON string.
  String toJson() => json.encode(toMap());
}
