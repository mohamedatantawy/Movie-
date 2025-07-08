part of 'bestmoivecubit_cubit.dart';

@immutable
sealed class BestmoivecubitState {}

final class Bestmoivecubitloading extends BestmoivecubitState {}

final class BestmoivecubitSecuess extends BestmoivecubitState {
 final List<Moiveentity> moives;

  BestmoivecubitSecuess({required this.moives});
}

final class Bestmoivecubitfailure extends BestmoivecubitState {
  final String emassage;

  Bestmoivecubitfailure({required this.emassage});
}

final class BestmoivecubitInitial extends BestmoivecubitState {}
