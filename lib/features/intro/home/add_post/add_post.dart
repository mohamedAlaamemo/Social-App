import 'package:flutter/material.dart';
import 'package:social_media/core/shared/icon_broken.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:Icon(IconBroken.Arrow___Left_2)),
        titleSpacing: 0.0,
        title: Text(
          'Add Post'
        ),
      ),
    );
  }
}
