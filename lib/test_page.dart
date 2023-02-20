import 'package:flutter/material.dart';
import 'core/widgets/my_button.dart';

class TestPage extends StatelessWidget {
   TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
        child: MyButton(
          text: 'Click',
          onPressed: (){},
        ),
      )
    );
  }
}
