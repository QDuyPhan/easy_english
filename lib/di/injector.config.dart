// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:just_audio/just_audio.dart' as _i501;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/config/hive_config.dart' as _i719;
import '../core/mapper/app_mappr.dart' as _i556;
import '../core/register_module/audio_player_provider.dart' as _i526;
import '../data/datasources/local/assets_data.dart' as _i481;
import '../data/datasources/local/local_data.dart' as _i614;
import '../data/datasources/local/them_local.dart' as _i110;
import '../data/datasources/notification/notification_data_source.dart'
    as _i179;
import '../data/repositories/notification_repository_impl.dart' as _i888;
import '../data/repositories/oxford_words_repository_impl.dart' as _i319;
import '../data/repositories/theme_repository_impl.dart' as _i792;
import '../data/repositories/topic_repository_impl.dart' as _i867;
import '../data/repositories/vocabulary_repository_impl.dart' as _i904;
import '../domain/repositories/notification_repository.dart' as _i965;
import '../domain/repositories/oxford_words_repository.dart' as _i212;
import '../domain/repositories/theme_repository.dart' as _i443;
import '../domain/repositories/topic_repository.dart' as _i13;
import '../domain/repositories/vocabulary_repository.dart' as _i1063;
import '../domain/usecases/cancel_notification_use_case.dart' as _i225;
import '../domain/usecases/get_all_oxford_words_use_case.dart' as _i822;
import '../domain/usecases/get_daily_words_use_case.dart' as _i246;
import '../domain/usecases/get_theme_use_case.dart' as _i131;
import '../domain/usecases/get_topics_use_case.dart' as _i280;
import '../domain/usecases/init_data_topics_use_case.dart' as _i599;
import '../domain/usecases/init_data_use_case.dart' as _i579;
import '../domain/usecases/save_theme_use_case.dart' as _i883;
import '../domain/usecases/save_word_use_case.dart' as _i528;
import '../domain/usecases/schedule_notification_use_case.dart' as _i812;
import '../domain/usecases/search_words_use_case.dart' as _i63;
import '../presentation/features/home/bloc/daily_words_bloc.dart' as _i531;
import '../presentation/features/search/blocs/search_bloc.dart' as _i529;
import '../presentation/features/theme/blocs/theme_bloc.dart' as _i1032;
import '../presentation/features/topics/blocs/topics_bloc.dart' as _i282;
import '../presentation/features/vocabulary/blocs/vocabulary_bloc.dart'
    as _i431;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final sharedPreferencesModule = _$SharedPreferencesModule();
  final audioPlayerModule = _$AudioPlayerModule();
  gh.factory<_i556.AppMappr>(() => _i556.AppMappr());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  await gh.singletonAsync<_i719.HiveConfig>(
    () => _i719.HiveConfig.create(),
    preResolve: true,
  );
  gh.lazySingleton<_i501.AudioPlayer>(() => audioPlayerModule.audioPlayer());
  gh.lazySingleton<_i179.NotificationDataSource>(
      () => _i179.NotificationDataSourceImpl());
  gh.lazySingleton<_i965.NotificationRepository>(() =>
      _i888.NotificationRepositoryImpl(
          notificationDataSource: gh<_i179.NotificationDataSource>()));
  gh.lazySingleton<_i481.AssetsData>(
      () => _i481.AssetsDataImpl(hiveConfig: gh<_i719.HiveConfig>()));
  gh.lazySingleton<_i614.LocalData>(
      () => _i614.LocalDataImpl(hiveConfig: gh<_i719.HiveConfig>()));
  gh.lazySingleton<_i212.OxfordWordsRepository>(
      () => _i319.OxfordWordsRepositoryImpl(
            assetsData: gh<_i481.AssetsData>(),
            localData: gh<_i614.LocalData>(),
            appMappr: gh<_i556.AppMappr>(),
          ));
  gh.lazySingleton<_i110.ThemeLocal>(() =>
      _i110.ThemeLocalImpl(sharedPreferences: gh<_i460.SharedPreferences>()));
  gh.factory<_i822.GetAllOxfordWordsUseCase>(
      () => _i822.GetAllOxfordWordsUseCase(gh<_i212.OxfordWordsRepository>()));
  gh.factory<_i579.InitDataUseCase>(
      () => _i579.InitDataUseCase(gh<_i212.OxfordWordsRepository>()));
  gh.factory<_i225.CancelNotificationUseCase>(
      () => _i225.CancelNotificationUseCase(gh<_i965.NotificationRepository>()));
  gh.factory<_i812.ScheduleNotificationUseCase>(
      () => _i812.ScheduleNotificationUseCase(gh<_i965.NotificationRepository>()));
  gh.lazySingleton<_i443.ThemeRepository>(
      () => _i792.ThemeRepositoryImpl(themeLocal: gh<_i110.ThemeLocal>()));
  gh.lazySingleton<_i1063.VocabularyRepository>(
      () => _i904.VocabularyRepositoryImpl(
            localData: gh<_i614.LocalData>(),
            appMappr: gh<_i556.AppMappr>(),
          ));
  gh.factory<_i431.VocabularyBloc>(() => _i431.VocabularyBloc(
      getAllOxfordWordsUseCase: gh<_i822.GetAllOxfordWordsUseCase>()));
  gh.factory<_i131.GetThemeUseCase>(() =>
      _i131.GetThemeUseCase(themeRepository: gh<_i443.ThemeRepository>()));
  gh.factory<_i883.SaveThemeUseCase>(() =>
      _i883.SaveThemeUseCase(themeRepository: gh<_i443.ThemeRepository>()));
  gh.lazySingleton<_i13.TopicRepository>(() => _i867.TopicRepositoryImpl(
        assetsData: gh<_i481.AssetsData>(),
        hiveConfig: gh<_i719.HiveConfig>(),
        localData: gh<_i614.LocalData>(),
        appMappr: gh<_i556.AppMappr>(),
      ));
  gh.factory<_i246.GetDailyWordsUseCase>(() => _i246.GetDailyWordsUseCase(
        vocabularyRepository: gh<_i1063.VocabularyRepository>(),
        oxfordWordsRepository: gh<_i212.OxfordWordsRepository>(),
        topicRepository: gh<_i13.TopicRepository>(),
      ));
  gh.factory<_i280.GetTopicsUseCase>(
      () => _i280.GetTopicsUseCase(gh<_i13.TopicRepository>()));
  gh.factory<_i599.InitDataTopics>(
      () => _i599.InitDataTopics(gh<_i13.TopicRepository>()));
  gh.factory<_i528.SaveWordUseCase>(
      () => _i528.SaveWordUseCase(gh<_i13.TopicRepository>()));
  gh.factory<_i282.TopicsBloc>(() => _i282.TopicsBloc(
        saveWordUseCase: gh<_i528.SaveWordUseCase>(),
        getAllTopics: gh<_i280.GetTopicsUseCase>(),
      ));
  gh.factory<_i531.DailyWordsBloc>(() => _i531.DailyWordsBloc(
      getDailyWordsUseCase: gh<_i246.GetDailyWordsUseCase>()));
  gh.factory<_i63.SearchWordsUseCase>(() => _i63.SearchWordsUseCase(
        oxfordWordsRepository: gh<_i212.OxfordWordsRepository>(),
        topicRepository: gh<_i13.TopicRepository>(),
      ));
  gh.factory<_i1032.ThemeBloc>(() => _i1032.ThemeBloc(
        getTheme: gh<_i131.GetThemeUseCase>(),
        saveTheme: gh<_i883.SaveThemeUseCase>(),
      ));
  gh.factory<_i529.SearchBloc>(() =>
      _i529.SearchBloc(searchWordsUseCase: gh<_i63.SearchWordsUseCase>()));
  return getIt;
}

class _$SharedPreferencesModule extends _i526.SharedPreferencesModule {}

class _$AudioPlayerModule extends _i526.AudioPlayerModule {}
