part of 'categer_cubit.dart';

@immutable
sealed class CategerState {}

final class CategerInitial extends CategerState {}

final class CategerLoading extends CategerState {}

final class CategerSucess extends CategerState {
  final List<Moiveentity> moives;

  CategerSucess({required this.moives});
}

final class CategerFailure extends CategerState {
  final String emassage;

  CategerFailure({required this.emassage});
}
