import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/doamin/repos/home_best_moive_repo.dart';

class HomeBestMoiveUsecase {
  final HomeBestMoiveRepo homeBestMoiveRepo;

  HomeBestMoiveUsecase({required this.homeBestMoiveRepo});
  Future<Either<Failure, List<Moiveentity>>> call() {
    print(homeBestMoiveRepo.fetchbestmoive().toString());
    return homeBestMoiveRepo.fetchbestmoive();
  }
}
