import 'package:easy_english/data/models/example.dart';
import 'package:easy_english/data/models/scheduled_notification.dart';
import 'package:easy_english/data/models/sense.dart';
import 'package:easy_english/data/models/settings_snapshot.dart';
import 'package:easy_english/data/models/word.dart';
import 'package:easy_english/data/models/word_status.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@singleton
@preResolve
class HiveConfig {
  static const String _wordKey = 'word';
  late Box<Word> _wordsBox;

  Box<Word> get wordsBox => _wordsBox;

  @factoryMethod // Phương thức khởi tạo đặc biệt
  static Future<HiveConfig> create() async {
    final manager = HiveConfig();
    await manager._init();
    return manager;
  }

  Future<void> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    // Đăng ký adapter cho WordModel
    Hive.registerAdapter(ExampleAdapter());
    Hive.registerAdapter(SenseAdapter());
    Hive.registerAdapter(WordStatusAdapter());
    Hive.registerAdapter(WordAdapter());
    Hive.registerAdapter(SettingsSnapshotAdapter());
    Hive.registerAdapter(ScheduledNotificationAdapter());
    // Mở box
    _wordsBox = await Hive.openBox<Word>(_wordKey);
  }
}
