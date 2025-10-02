class ExampleEntity {
  final String cf;
  final String x;

  ExampleEntity({required this.cf, required this.x});

  ExampleEntity copyWith({String? cf, String? x}) {
    return ExampleEntity(cf: cf ?? this.cf, x: x ?? this.x);
  }

  factory ExampleEntity.fromJson(Map<String, dynamic> json) {
    return ExampleEntity(cf: json['cf'], x: json['x']);
  }
}
