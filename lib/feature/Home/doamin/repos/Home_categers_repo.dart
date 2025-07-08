import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

abstract class HomeCategersRepo {
  Future<Either<Failure, List<Moiveentity>>> fetchcategersmoive({required String categer});
}
