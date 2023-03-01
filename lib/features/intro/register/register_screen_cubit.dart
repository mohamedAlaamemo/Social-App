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
    SocialAppModel model =SocialAppModel.name(name, phone, email,
    'https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/240805861_3102554376643653_8367513423742257604_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=13OXAIYFMvYAX-N5hx_&_nc_ht=scontent.fcai19-4.fna&oh=00_AfCu_iQxi0zV0fq5O1vqxVNYqg8KjaL1qZ9FEzAHF1IbSA&oe=6403071F'
     ,'write your bio..',
      'https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/220333435_3074664919432599_1075936896868253467_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_ohc=CpKuDgqnBccAX8sNPQc&_nc_ht=scontent.fcai19-4.fna&oh=00_AfCiaNcANSMlZg6YiFFYV8h7uqvKzP_lGc61rfJqEzTAQQ&oe=64039F7B'
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










