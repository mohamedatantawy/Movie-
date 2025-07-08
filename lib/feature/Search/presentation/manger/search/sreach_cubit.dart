import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Search/data/Repos/searchRepos.dart';

part 'sreach_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchreposim) : super(SreachInitial());
  final searchReposImple searchreposim;
  getSeach({required String word}) async {
    emit(SearchLoading());
    var data = await searchreposim.fetchsearch(word: word);
    print(data.toString());
    data.fold(
      (failuer) {
        emit(Searchfailure(emassage: failuer.errormassage));
      },
      (movie) {
        emit(SearchSucess(moive: movie));
      },
    );
  }
}
