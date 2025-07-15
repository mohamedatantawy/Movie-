import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/getit_server.dart';
import 'package:movie/core/utils/gorouter.dart';
import 'package:movie/core/utils/sqlite.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_best_moive_UseCase.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_categers_UseCase.dart';
import 'package:movie/feature/Home/presentation/manage/bestmoivecubit/bestmoivecubit_cubit.dart';
import 'package:movie/feature/Home/presentation/manage/categercubit/categer_cubit.dart';

//https://api.themoviedb.org/3/trending/movie/week?api_key=97ea7c349ceeda50e46757b66dd03fa6#
//image https://image.tmdb.org/t/p/w185//6ybVIbpAnI5oJespruRqdow5XsK.jpg
//https://api.themoviedb.org/3/discover/movie?api_key=97ea7c349ceeda50e46757b66dd03fa6
//key=sVYm0x5HZpY from the id from the movie
//https://www.youtube.com/embed/sVYm0x5HZpY?autoplay=0&controls=0
//similar
//https://api.themoviedb.org/3/movie/950387/similar?api_key=97ea7c349ceeda50e46757b66dd03fa6
//search
//https://api.themoviedb.org/3/search/movie?api_key=97ea7c349ceeda50e46757b66dd03fa6&query=game
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Sharedperfernace.setString('token', 'token');

  await Sqlitemothed().initdadabase();
  setup();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  BestmoivecubitCubit(getIt.get<HomeBestMoiveUsecase>())
                    ..getmoives(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: Gorouter.router,
      ),
    );
  }
}
