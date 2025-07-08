import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

abstract class HomeBestMoiveRepo {
  Future<Either<Failure, List<Moiveentity>>> fetchbestmoive();
}
