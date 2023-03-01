

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/network/local/cache_helper.dart';
import 'package:social_media/features/intro/home/add_post/add_post.dart';
import 'package:social_media/features/intro/home/home_page/homepage.dart';

import '../../../../core/model/social_model.dart';
import '../chat_page/chat_page.dart';
import '../settings_page/setting_page.dart';
import '../user_page/user_page.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>Screens=[
    HomePage(),
    ChatPage(),
    AddPost(),
    UsersPage(),
    SittingPage(),
  ];
  List<String>titles=[
    'Home',
    'Chat',
    'Post',
    'Users',
    'Settings'
  ];
  void ChangeScreen({
  required int index
}){
    if(index==2)
      {
        emit(LayoutAddPostState());
      }
    else {
      currentIndex = index;
      emit(LayoutChangeScreenState());
    }
    print('currentIndex= $currentIndex');
  }
  SocialAppModel model=
    SocialAppModel.name('', '', '', '', '','');
  void GitUserData(){
    emit(LayoutGitUserDataLodingState());
    FirebaseFirestore.instance.collection('users').doc(
      CacheHelper.getData(key: 'uId')
    ).get().then((value) {
      print(value.data());
      model=SocialAppModel.fromJson(value.data()!);
      emit(LayoutGitUserDataSuccessState());
    }).catchError((error){
      print(error);
      emit(LayoutGitUserDataErrorState());
    });
  }
}
