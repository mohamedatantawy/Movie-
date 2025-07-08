import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/feature/Details/domain/UseCase/SimilarBarUseCase.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.similarbarusecase) : super(SimilarInitial());

  final Similarbarusecase similarbarusecase;
  similarmothed({required int id}) async {
    emit(SimilarLaoding());
    var data = await similarbarusecase.call(id: id);
    data.fold(
      (failure) {
        emit(SimilarFailure(emassage: failure.errormassage));
      },
      (sucess) {
        emit(SimilarSucess(movie: sucess));
      },
    );
  }
}
