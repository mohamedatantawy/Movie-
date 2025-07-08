import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

abstract class Similarbar {
  Future<Either<Failure, List<Moiveentity>>> fetchsimilar({required int id});
}
