import 'package:easy_english/data/models/word.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/example.dart';
import '../../data/models/scheduled_notification.dart';
import '../../data/models/sense.dart';
import '../../data/models/settings_snapshot.dart';
import '../../data/models/word_status.dart';

class HiveConfig {
  static const String wordKey = 'word';

  Box<Word> get wordBox => Hive.box(wordKey);

  init() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    Hive.registerAdapter(ExampleAdapter());
    Hive.registerAdapter(SenseAdapter());
    Hive.registerAdapter(WordStatusAdapter());
    Hive.registerAdapter(WordAdapter());
    Hive.registerAdapter(SettingsSnapshotAdapter());
    Hive.registerAdapter(ScheduledNotificationAdapter());

    await Hive.openBox<Word>(wordKey);
  }
}
