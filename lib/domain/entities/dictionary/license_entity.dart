class LicenseEntity {
  final String? name;
  final String? url;

  LicenseEntity({this.name, this.url});

  LicenseEntity copyWith({String? name, String? url}) {
    return LicenseEntity(name: name ?? this.name, url: url ?? this.url);
  }

  factory LicenseEntity.fromJson(Map<String, dynamic> json) {
    return LicenseEntity(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'name': name ?? '', 'url': url ?? ''};
}
