
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';
import 'package:social_media/features/intro/home/layout_page/layout_page.dart';
import 'package:social_media/features/intro/login/cubit/login_cubit.dart';

import 'core/cubit/bloc_observer.dart';
import 'core/network/local/cache_helper.dart';
import 'core/shared/stayles.dart';
import 'features/intro/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CacheHelper.init();
  await Firebase.initializeApp();
  Widget startWidget=LoginPage();
  if(CacheHelper.getData(key: 'uId')!=null)
    {
      startWidget=LayoutPage();
    }
  runApp( MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  Widget startWidget;

   MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LayoutCubit()..GitUserData()),
        BlocProvider(create: (context)=>LoginCubit()),
      ],
      child: MaterialApp(
        theme: lightmode,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
