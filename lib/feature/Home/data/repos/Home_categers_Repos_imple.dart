import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Home/data/Remote/Home_Remote_Categer.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/doamin/repos/Home_categers_repo.dart';
import 'package:movie/feature/Home/doamin/repos/home_best_moive_repo.dart';

class HomeCategersReposImple extends HomeCategersRepo {
  final HomeRemoteCateger homeRemoteCateger;

  HomeCategersReposImple({required this.homeRemoteCateger});
  @override
  Future<Either<Failure, List<Moiveentity>>> fetchcategersmoive({
    required String categer,
  }) async {
    try {
      var data = await homeRemoteCateger.fetchcategersmoive(categer: categer);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromdioerror(e));
      } else {
        return left(Serverfailure(errormassage: e.toString()));
      }
    }
  }
}
