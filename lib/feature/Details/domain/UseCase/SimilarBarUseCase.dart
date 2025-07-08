import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Details/domain/Repos/similarbar.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

class Similarbarusecase {
  final Similarbar similarbar;

  Similarbarusecase({required this.similarbar});
  Future<Either<Failure, List<Moiveentity>>> call({required int id}) {
    return similarbar.fetchsimilar(id:id );
  }
}
