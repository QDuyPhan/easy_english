class DictionaryEntity {
  final String topic;
  final List<String> category;
  final String image;

  const DictionaryEntity({
    required this.topic,
    required this.category,
    required this.image,
  });

  factory DictionaryEntity.fromJson(Map<String, dynamic> json) =>
      DictionaryEntity(
        topic: json['topic'] ?? '',
        category:
            List<String>.from(json['category'].map((x) => x.toString())) ?? [],
        image: json['image'] ?? '',
      );

  Map<String, dynamic> toJson() => {'topic': topic, 'category': category};

  DictionaryEntity copyWith({String? topic, List<String>? category}) {
    return DictionaryEntity(
      topic: topic ?? this.topic,
      category: category ?? this.category,
      image: image,
    );
  }
}
