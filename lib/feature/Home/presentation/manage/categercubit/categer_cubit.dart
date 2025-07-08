import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_best_moive_UseCase.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_categers_UseCase.dart';

part 'categer_state.dart';

class CategerCubit extends Cubit<CategerState> {
  CategerCubit(this.homeCategersUsecase) : super(CategerInitial());
   List<String> itemscateges = [
    'now_playing',
    'upcoming',
    'top_rated',
    'popular',
  ];
  final HomeCategersUsecase homeCategersUsecase;
  getcateger( int number) async {
    emit(CategerLoading());
    var data = await homeCategersUsecase.call(categer:itemscateges[number] );
    data.fold(
      (fail) => emit(CategerFailure(emassage: fail.errormassage)),
      (moives) => emit(CategerSucess(moives: moives)),
    );
  }
}
