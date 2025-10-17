import 'package:freezed_annotation/freezed_annotation.dart';

import 'entry.dart';

part 'generated/entries.freezed.dart';
part 'generated/entries.g.dart';

@freezed
class Entries with _$Entries {
  const factory Entries({@Default([]) List<Entry> entry}) = _Entries;

  factory Entries.fromJson(Map<String, dynamic> json) =>
      _$EntriesFromJson(json);
}
