abstract class RegisterScreenState {}

class RegisterScreenInitial extends RegisterScreenState {}
class RegisterScreenShowPassword extends RegisterScreenState {}


class RegisterNewUserLodingState extends RegisterScreenState {}
class RegisterNewUserSuccessState extends RegisterScreenState {}
class RegisterNewUserErrorState extends RegisterScreenState {}


class CreateUserLodingState extends RegisterScreenState {}
class CreateUserSuccessState extends RegisterScreenState {}
class CreateUserErrorState extends RegisterScreenState {}