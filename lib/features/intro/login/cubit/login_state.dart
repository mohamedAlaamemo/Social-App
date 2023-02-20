part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class CubitShowPassword extends LoginState{}


class UserLoginLodingState extends LoginState {}
class UserLoginSuccessState extends LoginState {}
class UserLoginErrorState extends LoginState {}