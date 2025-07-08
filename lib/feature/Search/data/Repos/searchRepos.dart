import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Search/data/Remote/SearchRemoteSource.dart';

abstract class Searchrepos {
  Future<Either<Failure, List<Moiveentity>>> fetchsearch({required String word});
}
class searchReposImple implements Searchrepos{
 final SearchremotesourceImple searchremotesource;

  searchReposImple({required this.searchremotesource});
  @override
  Future<Either<Failure, List<Moiveentity>>> fetchsearch({required String word}) async{
    try {
      var data = await searchremotesource.fetchsearch(word: word);
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