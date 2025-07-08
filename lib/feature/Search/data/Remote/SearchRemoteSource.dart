import 'package:movie/core/utils/Api_servier.dart';
import 'package:movie/core/utils/const.dart';
import 'package:movie/feature/Home/data/models/moivemodels.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

abstract class Searchremotesource {
  Future<List<Moiveentity>> fetchsearch({required String word});
}

class SearchremotesourceImple implements Searchremotesource {
  final ApiServier apiServier;

  SearchremotesourceImple({required this.apiServier});
  @override
  Future<List<Moiveentity>> fetchsearch({required String word}) async {
    var data = await apiServier.get(
      path: "search/movie?api_key=97ea7c349ceeda50e46757b66dd03fa6&query=$word",
      // "search/movie?api_key=$Api_keyconst&query=$word",
    );
    data["results"];
    List<Moiveentity> retlist = [];
    for (var element in data["results"]) {
      retlist.add(Moivemodels.fromJson(element));
    }
    return retlist;
  }
}
