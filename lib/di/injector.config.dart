// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/config/hive_config.dart' as _i719;
import '../core/mapper/app_mappr.dart' as _i556;
import '../data/datasources/local/assets_data.dart' as _i481;
import '../data/datasources/local/local_data.dart' as _i614;
import '../data/repositories/oxford_words_repository_impl.dart' as _i319;
import '../data/repositories/topic_repository_impl.dart' as _i867;
import '../data/repositories/topics_words_repository_impl.dart' as _i606;
import '../domain/repositories/oxford_words_repository.dart' as _i212;
import '../domain/repositories/topic_repository.dart' as _i13;
import '../domain/repositories/topics_words_repository.dart' as _i429;
import '../domain/usecases/get_all_oxford_words_usecase.dart' as _i797;
import '../domain/usecases/get_topics_usecase.dart' as _i206;
import '../domain/usecases/init_data_topics.dart' as _i700;
import '../domain/usecases/init_data_usecase.dart' as _i287;
import '../domain/usecases/topics_usecase.dart' as _i586;
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
  gh.factory<_i556.AppMappr>(() => _i556.AppMappr());
  await gh.singletonAsync<_i719.HiveConfig>(
    () => _i719.HiveConfig.create(),
    preResolve: true,
  );
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
  gh.factory<_i797.GetAllOxfordWordsUseCase>(
      () => _i797.GetAllOxfordWordsUseCase(gh<_i212.OxfordWordsRepository>()));
  gh.factory<_i287.InitDataUseCase>(
      () => _i287.InitDataUseCase(gh<_i212.OxfordWordsRepository>()));
  gh.factory<_i431.VocabularyBloc>(() => _i431.VocabularyBloc(
      getAllOxfordWordsUseCase: gh<_i797.GetAllOxfordWordsUseCase>()));
  gh.lazySingleton<_i13.TopicRepository>(() => _i867.TopicRepositoryImpl(
        assetsData: gh<_i481.AssetsData>(),
        hiveConfig: gh<_i719.HiveConfig>(),
        localData: gh<_i614.LocalData>(),
        appMappr: gh<_i556.AppMappr>(),
      ));
  gh.lazySingleton<_i429.TopicsWordsRepository>(
      () => _i606.TopicsWordsRepositoryImpl(
            assetsData: gh<_i481.AssetsData>(),
            localData: gh<_i614.LocalData>(),
            appMappr: gh<_i556.AppMappr>(),
          ));
  gh.factory<_i206.GetTopicsUsecase>(
      () => _i206.GetTopicsUsecase(gh<_i13.TopicRepository>()));
  gh.factory<_i700.InitDataTopics>(
      () => _i700.InitDataTopics(gh<_i13.TopicRepository>()));
  gh.factory<_i586.GetTopicsUsecase>(
      () => _i586.GetTopicsUsecase(gh<_i13.TopicRepository>()));
  gh.factory<_i586.InitDataTopics>(
      () => _i586.InitDataTopics(gh<_i13.TopicRepository>()));
  gh.factory<_i282.TopicsBloc>(
      () => _i282.TopicsBloc(getAllTopics: gh<_i206.GetTopicsUsecase>()));
  return getIt;
}
