import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/utils/Api_servier.dart';
import 'package:movie/core/utils/const.dart';
import 'package:movie/feature/Home/data/models/moivemodels.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/doamin/repos/home_best_moive_repo.dart';

class HomeRemoteBestMoive implements HomeBestMoiveRepo {
  final ApiServier apiServier;

  HomeRemoteBestMoive({required this.apiServier});
  @override
  Future<Either<Failure, List<Moiveentity>>> fetchbestmoive() async {
    // try {
    var data = await apiServier.get(
      path: "trending/movie/week?api_key=$Api_keyconst",
    );
    List<Moiveentity> moivelist = [];
    List datas = data['results'];
    for (var element in datas) {
      moivelist.add(Moivemodels.fromJson(element));
    }
    print(data.toString());
    return right(moivelist);
    // } catch (e) {
    //   if (e is DioException)
    //     return left(Serverfailure.fromdioerror(e));
    //   else {
    //     return left(Serverfailure(errormassage: e.toString()));
    //   }
    //}
  }
}
