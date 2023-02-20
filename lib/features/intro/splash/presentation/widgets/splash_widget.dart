import 'package:flutter/material.dart';

import '../../../../../core/widgets/my_asset_image.dart';


class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: MyAssetImage(image: 'splash.png',),
    );
  }
}
