import 'package:go_router/go_router.dart';
import 'package:movie/feature/Details/presentation/view/DetailView.dart';
import 'package:movie/feature/Home/doamin/Entity/moiveEntity.dart';
import 'package:movie/feature/Home/presentation/Views/HomeView.dart';
import 'package:movie/feature/Profile/presentation/view/ProfileView.dart';
import 'package:movie/feature/Search/presentation/view/SearchView.dart';
import 'package:movie/feature/Setting/presentation/View/SettingView.dart';

abstract class Gorouter {
  static const String khomeView = '/';
  static const String kprofile = '/profileview';

  static const String kdetails = '/detailsview';

  static const String ksearch = '/searchview';

  static const String ksetting = '/settingview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: khomeView, builder: (context, state) => Homeview()),
      GoRoute(path: kprofile, builder: (context, state) => Profileview()),
      GoRoute(
        path: kdetails,
        builder: (context, state) {
          var movie = GoRouterState.of(context).extra as Moiveentity;
          return Detailview(moiveentity: movie);
        },
      ),
      GoRoute(path: ksearch, builder: (context, state) => Searchview()),
      GoRoute(path: ksetting, builder: (context, state) => Settingview()),
    ],
  );
}
