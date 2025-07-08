import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/getit_server.dart';
import 'package:movie/core/utils/styles.dart';
import 'package:movie/feature/Details/domain/UseCase/SimilarBarUseCase.dart';
import 'package:movie/feature/Details/presentation/manges/similarcubit/similar_cubit.dart';
import 'package:movie/feature/Details/presentation/view/widget/DetailViewBody.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';

class Detailview extends StatelessWidget {
  const Detailview({super.key, required this.moiveentity});
  final Moiveentity moiveentity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              SimilarCubit(getIt.get<Similarbarusecase>())
                ..similarmothed(id: moiveentity.idmoive),
      child: Scaffold(
        appBar: AppBar(
          title: Text("DetailPage", style: Styles.font26),
          centerTitle: true,
        ),
        body: Detailviewbody(moiveentity: moiveentity),
      ),
    );
  }
}
