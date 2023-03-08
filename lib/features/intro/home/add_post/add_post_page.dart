import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/shared/icon_broken.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';

class AddPost extends StatelessWidget {
   AddPost({Key? key}) : super(key: key);
  TextEditingController postTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if(state is LayoutCreateNewPostSuccessState)
          {
            postTextController.text='';
            LayoutCubit.get(context).RemoveImageNewPost();
          }
      },
      builder: (context, state) {
        var cubit=LayoutCubit.get(context).userModel;
        File? postImage=LayoutCubit.get(context).imageNewPost;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(IconBroken.Arrow___Left_2)),
            titleSpacing: 0.0,
            title: Text(
                'Create Post'
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if(LayoutCubit.get(context).imageNewPost==null) {
                    LayoutCubit.get(context).CreateNewPost(
                        date: DateTime.now().toString(),
                        postText: postTextController.text);
                  }
                  else if(LayoutCubit.get(context).imageNewPost!=null){
                    LayoutCubit.get(context).UploadImageNewPost(
                        date: DateTime.now().toString(),
                        postText: postTextController.text
                    );

                  }
                },
                child: Text(
                    'Post',
                    style: TextStyle(
                        fontSize: 20
                    )
                ),
              ),
              SizedBox(width: 10,)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if(state is LayoutCreateNewPostLodingState)
                  LinearProgressIndicator(),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              '${cubit.image}',
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            '${cubit.name}',
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: postTextController,
                        style: TextStyle(
                          fontFamily: 'jannah'
                        ),
                        decoration: InputDecoration(
                          hintText: 'write your post..',
                          enabledBorder: InputBorder.none,
                        ),
                        maxLines: 6,
                        minLines: 1,

                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if(LayoutCubit.get(context).imageNewPost!=null)
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Image.file(
                            postImage!,
                          width: double.infinity,
                          height: 250,
                        ),
                        IconButton(
                            onPressed: (){
                              LayoutCubit.get(context).RemoveImageNewPost();
                            },
                            icon: Icon(Icons.close,
                            color: Colors.teal,
                            )
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: (){
                              LayoutCubit.get(context).GetImageNewPost();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(IconBroken.Image),
                                Text(
                                  'add photo'
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '#tags'
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
