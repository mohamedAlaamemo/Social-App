import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/intro/register/register_screen_state.dart';

import '../../../core/model/social_model.dart';
import '../../../core/widgets/navigation.dart';
import '../../../core/widgets/show_toast.dart';
import '../login/login_page.dart';

class RegisterScreenCubit extends Cubit<RegisterScreenState> {
  RegisterScreenCubit() : super(RegisterScreenInitial());

  static RegisterScreenCubit get(context) => BlocProvider.of(context);
  bool isShowPassword = false;

  void ShowPassword() {
    isShowPassword = !isShowPassword;
    emit(RegisterScreenShowPassword());
  }

  void RegisterNewUser(context,
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(RegisterNewUserLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      CreateUser(
        context,
          email: email,
          name: name,
          phone: phone,
          uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterNewUserErrorState());
      displayErrorMotionToast(context, mes:error.toString());
    });
  }


  void CreateUser(context,{
    required String email,
    required String name,
    required String phone,
    required String uId
  })  {
    SocialAppModel model =SocialAppModel.name(
        name: name,
        phone: phone,
        email: email,
      image: 'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=996&t=st=1678108047~exp=1678108647~hmac=3ff9fcc7fea73a31233b202b5dc3c8a1d2191e9e75f523bfdea52c812fd42425',
        bio: 'write your bio..',
        backGround: 'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=996&t=st=1678100964~exp=1678101564~hmac=cc49d3afc087c12301555332994c1e07231ebcd5d83f62cb24d4e6acedd3c1f9'

    );
    emit(CreateUserLodingState());
     FirebaseFirestore.instance.collection('users').doc(uId)
        .set(model.toMap())
        .then((value) {
       emit(CreateUserSuccessState());
       Navigation.navigatorAndFinished(context, LoginPage());
       displaySuccessMotionToast(context, mes: 'You Have Register Successfully');

     }).catchError((error){
      emit(CreateUserErrorState());
          print(error.toString());
    });

  }



}










