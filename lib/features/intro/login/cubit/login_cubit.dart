import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/widgets/navigation.dart';
import '../../../../core/widgets/show_toast.dart';
import '../../home/layout_page/layout_page.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
  bool isShowPassword=false;
  void ShowPassword()
  {
    isShowPassword=!isShowPassword;
    emit(CubitShowPassword());
  }
  void UserLogin(context,
      {
        required String email,
        required String password,
      }) {
    emit(UserLoginLodingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);

      ShowToast(mes: "Login Successfully");
      emit(UserLoginSuccessState());
      LayoutCubit.get(context).GitUserData();
      LayoutCubit.get(context).GetAllPosts();
      Navigation.navigatorAndFinished(context, LayoutPage());
      print(value.user!.uid);
    }).catchError((error) {
      emit(UserLoginErrorState());
      displayErrorMotionToast(context, mes: error.toString());
      print(error);
    });
  }

}
