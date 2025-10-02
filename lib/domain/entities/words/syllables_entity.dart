import 'package:freezed_annotation/freezed_annotation.dart';

class SyllablesEntity {
  final int count;
  final List<String> list;

  SyllablesEntity({required this.count, required this.list});

  SyllablesEntity copyWith({int? count, List<String>? list}) {
    return SyllablesEntity(count: count ?? this.count, list: list ?? this.list);
  }

  factory SyllablesEntity.fromJson(Map<String, dynamic> json) {
    return SyllablesEntity(
      count: json['count'] ?? 0,
      list:
          json['list'] != null
              ? List<String>.from(json['list'].map((x) => x).toList())
              : [],
    );
  }
}
