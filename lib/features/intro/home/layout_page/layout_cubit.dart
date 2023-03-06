
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> Screens = [
    HomePage(),
    ChatPage(),
    AddPost(),
    UsersPage(),
    SittingPage(),
  ];
  List<String> titles = ['Home', 'Chat', 'Post', 'Users', 'Settings'];

  void ChangeScreen({required int index}) {
    if (index == 2) {
      emit(LayoutAddPostState());
    } else {
      currentIndex = index;
      emit(LayoutChangeScreenState());
    }
    print('currentIndex= $currentIndex');
  }

  SocialAppModel model = SocialAppModel.name('', '', '', '', '', '');

  void GitUserData() {
    emit(LayoutGitUserDataLodingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
      print(value.data());
      model = SocialAppModel.fromJson(value.data()!);
      emit(LayoutGitUserDataSuccessState());
    }).catchError((error) {
      print(error);
      emit(LayoutGitUserDataErrorState());
    });
  }



   File? imageProfile;
  final pickerCover = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await pickerCover.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageProfile = File(pickedFile.path);
        print(imageProfile?.path);
        emit(LayoutGetImageSuccessState());
      } else {
        emit(LayoutGetImageErrorState());
        print('No image selected.');
      }
  }
  
  
  void uploadImageProfile({
    required String name,
    required String bio,
    required String phone,
    String? image,
    String? cover,
  })
  {
    dynamic path=imageProfile?.path;
    FirebaseStorage.instance
    .ref()
    .child('users/${Uri.file(path!).pathSegments.last}')
    .putFile(imageProfile!)
        .then((value) {
          value.ref.getDownloadURL().then((value) {
            upDateUser(
                name: name,
                bio: bio,
                phone: phone,
                image: value
            );
            emit(LayoutGetDownloadURLSuccessState());
          }).catchError((error){
            emit(LayoutGetDownloadURLErrorState());
            print(error);
          });
          emit(LayoutUploadImageProfileSuccessState());
    }).catchError((error){
      emit(LayoutUploadImageProfileErrorState());
      print(error);
    });
  }

  File? imageCover;
  final picker = ImagePicker();

  Future<void> getImageCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageCover = File(pickedFile.path);
      print(imageCover?.path);
      emit(LayoutGetImageCoverSuccessState());
    } else {
      emit(LayoutGetImageCoverErrorState());
      print('No image selected.');
    }
  }
  void uploadImageCover({
    required String name,
    required String bio,
    required String phone,
    String? image,
    String? cover,
  })
  {
    dynamic path=imageCover?.path;
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(path!).pathSegments.last}')
        .putFile(imageCover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        upDateUser(
            name: name,
            bio: bio,
            phone: phone,
            cover: value
        );
        emit(LayoutGetDownloadURLSuccessState());
      }).catchError((error){
        emit(LayoutGetDownloadURLErrorState());
        print(error);
      });
      emit(LayoutUploadImageCoverSuccessState());
    }).catchError((error){
      emit(LayoutUploadImageCoverErrorState());
      print(error);
    });
  }


  void upDateUser({
  required String name,
  required String bio,
  required String phone,
   String? image,
   String? cover,
}){
    emit(LayoutUpDateUserLodingState());
    SocialAppModel model1 =SocialAppModel.name(
        name,
        phone,
        model.email,
        image??model.image,
        bio,
        cover??model.backGround
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .update(model1.toMap())
        .then((value) {
      GitUserData();
    }).catchError((error){
      print(error);
      emit(LayoutUpDateUserErrorState());
    });

  }
}
