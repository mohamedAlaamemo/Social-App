
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/core/model/message_model.dart';
import 'package:social_media/core/model/post_model.dart';
import 'package:social_media/core/network/local/cache_helper.dart';
import 'package:social_media/features/intro/home/add_post/add_post_page.dart';
import 'package:social_media/features/intro/home/home_page/homepage.dart';

import '../../../../core/model/social_model.dart';
import '../../../../core/widgets/show_toast.dart';
import '../chat_page/chat_page.dart';
import '../settings_page/setting_page.dart';
import '../user_page/user_page.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  void EmitState(){
    emit(LayoutEmitState());
  }
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
    if (index== 1)
      {
        GetAllUsers();
      }
    if (index == 2) {
      emit(LayoutScreenOfAddPostState());
    } else {
      currentIndex = index;
      emit(LayoutChangeScreenState());
    }
    print('currentIndex= $currentIndex');

  }

  SocialAppModel userModel = SocialAppModel.name();

  void GitUserData() {
    emit(LayoutGitUserDataLodingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
      print(value.data());
      userModel = SocialAppModel.fromJson(value.data()!);
      emit(LayoutGitUserDataSuccessState());
    }).catchError((error) {
      print(error);
      emit(LayoutGitUserDataErrorState());
    });
  }



   File? imageProfile;
  final pickerCover = ImagePicker();

  Future<void> GetImage() async {
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
  
  
  void UploadImageProfile({
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
            UpDateUser(
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

  Future<void> GetImageCover() async {
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
  void UploadImageCover({
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
        UpDateUser(
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


  void UpDateUser({
  required String name,
  required String bio,
  required String phone,
   String? image,
   String? cover,
}){
    emit(LayoutUpDateUserLodingState());
    SocialAppModel model1 =SocialAppModel.name(
        name: name,
        phone: phone,
        email: userModel.email,
        image: image??userModel.image,
        bio: bio,
        backGround: cover??userModel.backGround
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model1.toMap())
        .then((value) {
      GitUserData();
    }).catchError((error){
      print(error);
      emit(LayoutUpDateUserErrorState());
    });

  }

  void CreateNewPost({
  required String date,
    required String postText,
    String postImage='',
}){
    emit(LayoutCreateNewPostLodingState());
    CreateNewPostModel postModel=CreateNewPostModel.name(
       name:userModel.name,
        image: userModel.image,
        postText: postText,
        postImage:postImage,
        date:date
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap()).then((value) {
      ShowToast(mes: 'Post Create Successfully');

      emit(LayoutCreateNewPostSuccessState());
    }).catchError((error){
      emit(LayoutCreateNewPostErrorState());
      print(error);
    });
  }

  File? imageNewPost;
  final pickerImageNewPost = ImagePicker();

  Future<void> GetImageNewPost() async {
    final pickedFile = await pickerImageNewPost.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageNewPost = File(pickedFile.path);
      print(imageNewPost?.path);
      emit(LayoutGetImageNewPostSuccessState());
    } else {
      emit(LayoutGetImageNewPostErrorState());
      print('No image selected.');
    }
  }


  void RemoveImageNewPost(){
    imageNewPost=null;
    emit(LayoutRemoveImageNewPostState());
  }



  void UploadImageNewPost({
  required String date,
    required String postText,
})
  {
    dynamic path=imageNewPost?.path;
    emit(LayoutUploadImageNewPostLodingState());
    FirebaseStorage.instance
        .ref()
        .child('postsImage/${Uri.file(path!).pathSegments.last}')
        .putFile(imageNewPost!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(LayoutUploadImageNewPostSuccessState());
      CreateNewPost(
            date: date,
            postText: postText,
          postImage: value,
        );
      }).catchError((error){
        emit(LayoutUploadImageNewPostErrorState());
        print(error);
      });
      emit(LayoutUploadImageProfileSuccessState());
    }).catchError((error){
      emit(LayoutUploadImageProfileErrorState());
      print(error);
    });
  }
  
  
  
  
  
  List<CreateNewPostModel>allPostList=[];
  List<String>postId=[];
  List<int>postLikesCount=[];
  void GetAllPosts(){
    emit(LayoutGetAllPostsLodingState());
    allPostList=[];
    postId=[];
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            element.reference
            .collection('likes')
            .get()
            .then((value) {
              postLikesCount.add(value.docs.length);
              postId.add(element.id);
              allPostList.add(CreateNewPostModel.fromJson(element.data()));
            }).catchError((error){
              print(error);
            });
          });
          emit(LayoutGetAllPostsSuccessState());
    })
        .catchError((error){
      emit(LayoutGetAllPostsErrorState());
      print(error);
    });
    
  }




  void LikePost({
  required String postId
}){

    emit(LayoutLikePostLodingState());

    FirebaseFirestore.instance
    .collection('posts')
    .doc(postId)
    .collection('likes')
    .doc(CacheHelper.getData(key: 'uId'))
    .set({
      'Likes':true
    })
    .then((value) {
      emit(LayoutLikePostSuccessState());
    })
    .catchError((error){
      emit(LayoutLikePostErrorState());
      print(error);
    });



  }



  List<SocialAppModel>allUsersList=[];
  void GetAllUsers(){
    emit(LayoutGetAllUsersLodingState());
    allUsersList=[];
    FirebaseFirestore.instance
    .collection('users')
    .get()
    .then((value) {
      value.docs.forEach((element) {
        if(userModel.uId!=element.id)
          allUsersList.add(SocialAppModel.fromJson(element.data()));
      });
      emit(LayoutGetAllUsersSuccessState());
    })
    .catchError((error){
      print(error);
      emit(LayoutGetAllUsersErrorState());
    });

  }
  
  
  
  
  
  void SendMessage({
  required String senderId,
    required String? receiverId,
    required String date,
    required String textMessage,
}){
    emit(LayoutSendMessageLodingState());
    SendMessageModel model=SendMessageModel.name(
      date: date,
      textMessage: textMessage,
      senderId: senderId,
      receiverId: receiverId
    );
    FirebaseFirestore.instance
    .collection('users')
    .doc(senderId)
    .collection('chats')
    .doc(receiverId)
    .collection('message')
    .add(model.toMap())
        .then((value) {
      emit(LayoutSendMessageSuccessState());
    }).catchError((error){
      emit(LayoutSendMessageErrorState());
      print(error);
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(senderId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(LayoutSendMessageSuccessState());
    }).catchError((error){
      emit(LayoutSendMessageErrorState());
      print(error);
    });
  }


  List<SendMessageModel>messageInChat=[];
  void GetMessageInChat({
    required String senderId,
    required String? receiverId,
}){
    FirebaseFirestore.instance
    .collection('users')
    .doc(senderId)
    .collection('chats')
    .doc(receiverId)
    .collection('message')
    .orderBy('date')
    .snapshots()
    .listen((event) {
      messageInChat=[];
    event.docs.forEach((element) {
        messageInChat.add(SendMessageModel.fromJson(element.data()));
      });
      emit(LayoutGetMessageInChatState());
    });

  }
  
}
