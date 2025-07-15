import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/const.dart';
import 'package:movie/core/utils/getit_server.dart';
import 'package:movie/feature/Home/doamin/Use_Case/Home_categers_UseCase.dart';
import 'package:movie/feature/Home/presentation/Views/widget/homeViewBody.dart';
import 'package:movie/feature/Profile/presentation/view/ProfileView.dart';
import 'package:movie/feature/Search/presentation/view/SearchView.dart';
import 'package:movie/feature/Setting/presentation/View/SettingView.dart';

import '../manage/categercubit/categer_cubit.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _page = 0;
  List<Widget> showitems = [Homeviewbody(), Searchview(), Settingview()];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategerCubit(getIt.get<HomeCategersUsecase>()),
        ),
      ],
      child: Scaffold(
        backgroundColor: kprimaycolor,
        body: showitems[_page],
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.lightBlue,
          // backgroundColor: const Color.fromARGB(255, 4, 45, 118),
          color: kbluecolor,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            Icon(Icons.menu, size: 25, color: Colors.white),
            //    Icon(Icons.person, size: 25, color: Colors.white),
            Icon(Icons.search, size: 25, color: Colors.white),
            Icon(Icons.favorite_sharp, size: 25, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
