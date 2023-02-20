


import 'package:flutter/material.dart';

import '../../../../../core/widgets/navigation.dart';
import '../../../../../test_page.dart';
import '../widgets/splash_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      Navigation.navigatorAndFinished(context,TestPage() );
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashWidget(),
    );
  }
}
