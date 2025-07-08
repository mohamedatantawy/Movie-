import 'package:movie/core/utils/Api_servier.dart';
import 'package:movie/core/utils/const.dart';
import 'package:movie/feature/Home/data/models/moivemodels.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

abstract class Similarremotedate {
  Future<List<Moiveentity>> fetchsimilar({required int id});
}

class Similarremotedateimlp implements Similarremotedate {
  final ApiServier apiServier;

  Similarremotedateimlp({required this.apiServier});
  @override
  Future<List<Moiveentity>> fetchsimilar({required int id}) async {
    var data = await apiServier.get(
      path: 'movie/$id/similar?api_key=$Api_keyconst',
    );
    data["results"];
    List<Moiveentity> retlist = [];
    for (var element in data["results"]) {
      retlist.add(Moivemodels.fromJson(element));
    }
    return retlist;
  }
}
