part of 'sreach_cubit.dart';

@immutable
sealed class SearchState {}

final class SreachInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSucess extends SearchState {
  final List<Moiveentity> moive;

  SearchSucess({required this.moive});
}

final class Searchfailure extends SearchState {
  final String emassage;

  Searchfailure({required this.emassage});
}
