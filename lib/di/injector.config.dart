// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:just_audio/just_audio.dart' as _i501;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/config/networking/dio_client.dart' as _i716;
import '../core/mapper/app_mappr.dart' as _i556;
import '../core/register_module/register_module.dart' as _i338;
import '../core/utils/local_notifications_tools.dart' as _i863;
import '../data/datasources/local/assets_data.dart' as _i481;
import '../data/datasources/local/local_data.dart' as _i614;
import '../data/datasources/local/them_local.dart' as _i110;
import '../data/datasources/remote/hero_ku_service.dart' as _i512;
import '../data/datasources/remote/words_service.dart' as _i82;
import '../data/repositories/dictionary_repository_impl.dart' as _i1010;
import '../data/repositories/hero_ku_repository_impl.dart' as _i489;
import '../data/repositories/notifications_repository_impl.dart' as _i935;
import '../data/repositories/oxford_words_repository_impl.dart' as _i319;
import '../data/repositories/theme_repository_impl.dart' as _i792;
import '../data/repositories/topic_repository_impl.dart' as _i867;
import '../data/repositories/vocabulary_repository_impl.dart' as _i904;
import '../data/repositories/words_repository_impl.dart' as _i1045;
import '../domain/repositories/dictionary_repository.dart' as _i794;
import '../domain/repositories/hero_ku_repository.dart' as _i1013;
import '../domain/repositories/notifications_repository.dart' as _i246;
import '../domain/repositories/oxford_words_repository.dart' as _i212;
import '../domain/repositories/theme_repository.dart' as _i443;
import '../domain/repositories/topic_repository.dart' as _i13;
import '../domain/repositories/vocabulary_repository.dart' as _i1063;
import '../domain/repositories/words_repository.dart' as _i20;
import '../domain/usecases/get_all_oxford_words_use_case.dart' as _i822;
import '../domain/usecases/get_daily_words_use_case.dart' as _i246;
import '../domain/usecases/get_dictionary_use_case.dart' as _i1030;
import '../domain/usecases/get_theme_use_case.dart' as _i131;
import '../domain/usecases/get_topic_from_json_use_case.dart' as _i836;
import '../domain/usecases/get_topics_use_case.dart' as _i280;
import '../domain/usecases/hero_ku/fetch_randoms_words_use_case.dart' as _i894;
import '../domain/usecases/notifications/get_scheduled_notifications_use_case.dart'
    as _i433;
import '../domain/usecases/notifications/remove_scheduled_notification_use_case.dart'
    as _i701;
import '../domain/usecases/notifications/save_scheduled_notification_use_case.dart'
    as _i388;
import '../domain/usecases/save_oxford_word_use_case.dart' as _i259;
import '../domain/usecases/save_theme_use_case.dart' as _i883;
import '../domain/usecases/save_topic_word_use_case.dart' as _i902;
import '../domain/usecases/search_words_use_case.dart' as _i63;
import '../domain/usecases/words/get_list_word_use_case.dart' as _i143;
import '../domain/usecases/words/get_word_use_case.dart' as _i553;
import '../presentation/features/dictionary/bloc/dictionary_bloc.dart' as _i69;
import '../presentation/features/home/bloc/daily_words_bloc.dart' as _i531;
import '../presentation/features/home/bloc/words_bloc.dart' as _i859;
import '../presentation/features/notifications/bloc/notifications_bloc.dart'
    as _i382;
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
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final sharedPreferencesModule = _$SharedPreferencesModule();
  final audioPlayerModule = _$AudioPlayerModule();
  final registerModule = _$RegisterModule();
  gh.factory<_i556.AppMappr>(() => _i556.AppMappr());
  gh.factory<_i863.LocalNotificationsTools>(
    () => _i863.LocalNotificationsTools(),
  );
  gh.factory<_i822.GetAllOxfordWordsUseCase>(
    () => _i822.GetAllOxfordWordsUseCase(),
  );
  gh.factory<_i431.VocabularyBloc>(() => _i431.VocabularyBloc());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.factory<_i553.GetWordUseCase>(() => _i553.GetWordUseCase());
  gh.factory<_i859.WordsBloc>(() => _i859.WordsBloc());
  gh.factory<_i143.GetListWordUseCase>(() => _i143.GetListWordUseCase());
  gh.factory<_i894.FetchRandomsWordsUseCase>(
    () => _i894.FetchRandomsWordsUseCase(),
  );
  gh.lazySingleton<_i501.AudioPlayer>(() => audioPlayerModule.audioPlayer());
  gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i716.WordsDio>(() => _i716.WordsDio(gh<_i895.Connectivity>()));
  gh.factory<_i716.DatamuseDio>(
    () => _i716.DatamuseDio(gh<_i895.Connectivity>()),
  );
  gh.factory<_i716.DictionaryDio>(
    () => _i716.DictionaryDio(gh<_i895.Connectivity>()),
  );
  gh.factory<_i716.HeroKuDio>(() => _i716.HeroKuDio(gh<_i895.Connectivity>()));
  gh.lazySingleton<_i82.WordsService>(() => _i82.WordsServiceImpl());
  gh.lazySingleton<_i614.LocalData>(() => _i614.LocalDataImpl());
  gh.lazySingleton<_i481.AssetsData>(() => _i481.AssetsDataImpl());
  gh.lazySingleton<_i512.HeroKuService>(() => _i512.HeroKuServiceImpl());
  gh.lazySingleton<_i20.WordsRepository>(() => _i1045.WordsRepositoryImpl());
  gh.lazySingleton<_i1063.VocabularyRepository>(
    () => _i904.VocabularyRepositoryImpl(
      localData: gh<_i614.LocalData>(),
      appMappr: gh<_i556.AppMappr>(),
    ),
  );
  gh.lazySingleton<_i1013.HeroKuRepository>(() => _i489.HeroKuRepositoryImpl());
  gh.lazySingleton<_i212.OxfordWordsRepository>(
    () => _i319.OxfordWordsRepositoryImpl(),
  );
  gh.lazySingleton<_i246.NotificationsRepository>(
    () => _i935.NotificationsRepositoryImpl(
      localData: gh<_i614.LocalData>(),
      appMappr: gh<_i556.AppMappr>(),
    ),
  );
  gh.factory<_i433.GetScheduledNotificationsUseCase>(
    () => _i433.GetScheduledNotificationsUseCase(
      gh<_i246.NotificationsRepository>(),
    ),
  );
  gh.factory<_i701.RemoveScheduledNotificationUseCase>(
    () => _i701.RemoveScheduledNotificationUseCase(
      gh<_i246.NotificationsRepository>(),
    ),
  );
  gh.factory<_i388.SaveScheduledNotificationUseCase>(
    () => _i388.SaveScheduledNotificationUseCase(
      gh<_i246.NotificationsRepository>(),
    ),
  );
  gh.lazySingleton<_i13.TopicRepository>(
    () => _i867.TopicRepositoryImpl(
      assetsData: gh<_i481.AssetsData>(),
      localData: gh<_i614.LocalData>(),
      appMappr: gh<_i556.AppMappr>(),
    ),
  );
  gh.factory<_i259.SaveOxfordWordUseCase>(
    () => _i259.SaveOxfordWordUseCase(gh<_i212.OxfordWordsRepository>()),
  );
  gh.lazySingleton<_i110.ThemeLocal>(
    () =>
        _i110.ThemeLocalImpl(sharedPreferences: gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i794.DictionaryRepository>(
    () => _i1010.DictionaryRepositoryImpl(appMappr: gh<_i556.AppMappr>()),
  );
  gh.factory<_i1030.GetDictionaryUseCase>(
    () => _i1030.GetDictionaryUseCase(gh<_i794.DictionaryRepository>()),
  );
  gh.factory<_i246.GetDailyWordsUseCase>(
    () => _i246.GetDailyWordsUseCase(
      vocabularyRepository: gh<_i1063.VocabularyRepository>(),
      oxfordWordsRepository: gh<_i212.OxfordWordsRepository>(),
      topicRepository: gh<_i13.TopicRepository>(),
    ),
  );
  gh.factory<_i280.GetTopicsUseCase>(
    () => _i280.GetTopicsUseCase(gh<_i13.TopicRepository>()),
  );
  gh.factory<_i836.GetTopicFromJsonUseCase>(
    () => _i836.GetTopicFromJsonUseCase(gh<_i13.TopicRepository>()),
  );
  gh.factory<_i902.SaveTopicWordUseCase>(
    () => _i902.SaveTopicWordUseCase(gh<_i13.TopicRepository>()),
  );
  gh.factory<_i282.TopicsBloc>(
    () => _i282.TopicsBloc(
      saveTopicWordUseCase: gh<_i902.SaveTopicWordUseCase>(),
      getTopicsUseCase: gh<_i280.GetTopicsUseCase>(),
      getTopicFromJsonUseCase: gh<_i836.GetTopicFromJsonUseCase>(),
    ),
  );
  gh.lazySingleton<_i443.ThemeRepository>(
    () => _i792.ThemeRepositoryImpl(themeLocal: gh<_i110.ThemeLocal>()),
  );
  gh.factory<_i69.DictionaryBloc>(
    () => _i69.DictionaryBloc(
      getDictionaryUseCase: gh<_i1030.GetDictionaryUseCase>(),
    ),
  );
  gh.factory<_i382.NotificationsBloc>(
    () => _i382.NotificationsBloc(
      localNotificationsTools: gh<_i863.LocalNotificationsTools>(),
      getScheduledNotificationsUseCase:
          gh<_i433.GetScheduledNotificationsUseCase>(),
      removeScheduledNotificationsUseCase:
          gh<_i701.RemoveScheduledNotificationUseCase>(),
      saveScheduledNotificationUseCase:
          gh<_i388.SaveScheduledNotificationUseCase>(),
    ),
  );
  gh.factory<_i531.DailyWordsBloc>(
    () => _i531.DailyWordsBloc(
      getDailyWordsUseCase: gh<_i246.GetDailyWordsUseCase>(),
    ),
  );
  gh.factory<_i63.SearchWordsUseCase>(
    () => _i63.SearchWordsUseCase(
      oxfordWordsRepository: gh<_i212.OxfordWordsRepository>(),
      topicRepository: gh<_i13.TopicRepository>(),
    ),
  );
  gh.factory<_i131.GetThemeUseCase>(
    () => _i131.GetThemeUseCase(themeRepository: gh<_i443.ThemeRepository>()),
  );
  gh.factory<_i883.SaveThemeUseCase>(
    () => _i883.SaveThemeUseCase(themeRepository: gh<_i443.ThemeRepository>()),
  );
  gh.factory<_i529.SearchBloc>(
    () => _i529.SearchBloc(searchWordsUseCase: gh<_i63.SearchWordsUseCase>()),
  );
  gh.factory<_i1032.ThemeBloc>(
    () => _i1032.ThemeBloc(
      getTheme: gh<_i131.GetThemeUseCase>(),
      saveTheme: gh<_i883.SaveThemeUseCase>(),
    ),
  );
  return getIt;
}

class _$SharedPreferencesModule extends _i338.SharedPreferencesModule {}

class _$AudioPlayerModule extends _i338.AudioPlayerModule {}

class _$RegisterModule extends _i338.RegisterModule {}
