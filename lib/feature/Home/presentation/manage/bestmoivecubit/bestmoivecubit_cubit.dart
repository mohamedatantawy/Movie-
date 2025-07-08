import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_best_moive_UseCase.dart';

part 'bestmoivecubit_state.dart';

class BestmoivecubitCubit extends Cubit<BestmoivecubitState> {
  BestmoivecubitCubit(this.homeBestMoiveUsecase)
    : super(BestmoivecubitInitial());
  final HomeBestMoiveUsecase homeBestMoiveUsecase;
  getmoives() async {
    emit(Bestmoivecubitloading());
    var data = await homeBestMoiveUsecase.call();
    data.fold(
      (fail) {
        emit(Bestmoivecubitfailure(emassage: fail.errormassage));
      },
      (moives) {
        emit(BestmoivecubitSecuess(moives: moives));
      },
    );
  }
}
