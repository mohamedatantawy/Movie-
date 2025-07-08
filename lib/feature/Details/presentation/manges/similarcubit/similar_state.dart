part of 'similar_cubit.dart';

@immutable
sealed class SimilarState {}

final class SimilarInitial extends SimilarState {}

final class SimilarLaoding extends SimilarState {}

final class SimilarSucess extends SimilarState {
  final List<Moiveentity> movie;

  SimilarSucess({required this.movie});
}

final class SimilarFailure extends SimilarState {
  final String emassage;

  SimilarFailure({required this.emassage});
}
