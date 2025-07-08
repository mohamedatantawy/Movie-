import 'package:movie/core/utils/Api_servier.dart';
import 'package:movie/core/utils/const.dart';
import 'package:movie/feature/Home/data/models/moivemodels.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

abstract class HomeRemoteCateger {
  Future<List<Moiveentity>> fetchcategersmoive({required String categer});
}

class HomeRemoteCategerimple extends HomeRemoteCateger {
  final ApiServier apiServier;

  HomeRemoteCategerimple({required this.apiServier});
  @override
  Future<List<Moiveentity>> fetchcategersmoive({required String categer}) async {
    var data = await apiServier.get(
      path: "movie/$categer?api_key=$Api_keyconst",
    );
    List<Moiveentity> moivelist = [];
    List datas = data['results'];
    for (var element in datas) {
      moivelist.add(Moivemodels.fromJson(element));
    }
    return moivelist;
  }
}
