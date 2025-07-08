import 'package:easy_english/data/models/example.dart';
import 'package:easy_english/data/models/scheduled_notification.dart';
import 'package:easy_english/data/models/sense.dart';
import 'package:easy_english/data/models/settings_snapshot.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:easy_english/data/models/word_status.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@singleton
@preResolve
class HiveConfig {
  static const String _wordKey = 'word';
  static const String _topicsKey = 'topics';
  static const String _dailyWordsKey = 'daily_words';

  late Box<Word> _wordsBox;
  late Box<Word> _dailyWordsBox;
  late Box<List<Word>> _topicsBox;

  Box<Word> get wordsBox => _wordsBox;

  Box<Word> get dailyWordsBox => _dailyWordsBox;

  Box<List<Word>> get topicsBox => _topicsBox;

  @factoryMethod // Phương thức khởi tạo đặc biệt
  static Future<HiveConfig> create() async {
    final manager = HiveConfig();
    await manager._init();
    return manager;
  }

  Future<void> _init() async {
    if (kIsWeb) {
      await Hive.initFlutter(); // Web không cần `dir.path`
    } else {
      final dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    }
    // Đăng ký adapter cho WordModel
    Hive.registerAdapter(ExampleAdapter());
    Hive.registerAdapter(SenseAdapter());
    Hive.registerAdapter(WordStatusAdapter());
    Hive.registerAdapter(WordAdapter());
    Hive.registerAdapter(SettingsSnapshotAdapter());
    Hive.registerAdapter(ScheduledNotificationAdapter());
    // Mở box
    _wordsBox = await Hive.openBox<Word>(_wordKey);
    _dailyWordsBox = await Hive.openBox<Word>(_dailyWordsKey);
    _topicsBox = await Hive.openBox<List<Word>>(_topicsKey);
  }
}
