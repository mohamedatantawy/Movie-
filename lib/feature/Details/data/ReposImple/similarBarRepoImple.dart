import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Details/data/Data_source/similarRemoteDate.dart';
import 'package:movie/feature/Details/domain/Repos/similarbar.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

class Similarbarrepoimple implements Similarbar {
  final Similarremotedate similarremotedate;

  Similarbarrepoimple({required this.similarremotedate});
  @override
  Future<Either<Failure, List<Moiveentity>>> fetchsimilar({
    required int id,
  }) async {
    try {
      var data = await similarremotedate.fetchsimilar(id: id);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromdioerror(e));
      }else 
      {
        return left(Serverfailure(errormassage:  e.toString()));
      }
    }
  }
}
