import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/doamin/repos/Home_categers_repo.dart';

class HomeCategersUsecase {
  final HomeCategersRepo homeCategersRepo;

  HomeCategersUsecase({required this.homeCategersRepo});
  Future<Either<Failure, List<Moiveentity>>> call({required String categer}) {
    return homeCategersRepo.fetchcategersmoive(categer: categer);
  }
}
