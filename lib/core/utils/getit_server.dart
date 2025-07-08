import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/core/utils/Api_servier.dart';
import 'package:movie/feature/Details/data/Data_source/similarRemoteDate.dart';
import 'package:movie/feature/Details/data/ReposImple/similarBarRepoImple.dart';
import 'package:movie/feature/Details/domain/UseCase/SimilarBarUseCase.dart';
import 'package:movie/feature/Home/data/Remote/Home_Remote_Best_moive.dart';
import 'package:movie/feature/Home/data/Remote/Home_Remote_Categer.dart';
import 'package:movie/feature/Home/data/repos/Home_categers_Repos_imple.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_best_moive_UseCase.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_categers_UseCase.dart';
import 'package:movie/feature/Search/data/Remote/SearchRemoteSource.dart';
import 'package:movie/feature/Search/data/Repos/searchRepos.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiServier>(() => ApiServier(dio: getIt<Dio>()));
  getIt.registerLazySingleton<HomeRemoteBestMoive>(
    () => HomeRemoteBestMoive(apiServier: getIt<ApiServier>()),
  );
  getIt.registerLazySingleton<HomeBestMoiveUsecase>(
    () => HomeBestMoiveUsecase(homeBestMoiveRepo: getIt<HomeRemoteBestMoive>()),
  );

  getIt.registerLazySingleton<HomeRemoteCategerimple>(
    () => HomeRemoteCategerimple(apiServier: getIt<ApiServier>()),
  );
  getIt.registerLazySingleton<HomeCategersReposImple>(
    () => HomeCategersReposImple(
      homeRemoteCateger: getIt<HomeRemoteCategerimple>(),
    ),
  );
  getIt.registerLazySingleton<HomeCategersUsecase>(
    () =>
        HomeCategersUsecase(homeCategersRepo: getIt<HomeCategersReposImple>()),
  );

  getIt.registerLazySingleton<Similarremotedateimlp>(
    () => Similarremotedateimlp(apiServier: getIt<ApiServier>()),
  );

  getIt.registerLazySingleton<Similarbarrepoimple>(
    () =>
        Similarbarrepoimple(similarremotedate: getIt<Similarremotedateimlp>()),
  );
  getIt.registerLazySingleton<Similarbarusecase>(
    () => Similarbarusecase(similarbar: getIt<Similarbarrepoimple>()),
  );

  getIt.registerLazySingleton<SearchremotesourceImple>(
    () => SearchremotesourceImple(apiServier: getIt<ApiServier>()),
  );
  getIt.registerLazySingleton<searchReposImple>(
    () =>
        searchReposImple(searchremotesource: getIt<SearchremotesourceImple>()),
  );
}
