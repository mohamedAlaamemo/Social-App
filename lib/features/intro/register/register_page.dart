import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/intro/register/register_screen_cubit.dart';
import 'package:social_media/features/intro/register/register_screen_state.dart';
import '../../../core/widgets/input_field.dart';
import '../../../core/widgets/my_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterScreenCubit(),
      child: BlocConsumer<RegisterScreenCubit, RegisterScreenState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Register',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Register now to communicate with friends',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextInput(
                      controller: nameController,
                      label: 'User Name',
                      prefixIcon: Icon(Icons.person),
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextInput(
                      controller: emailController,
                      label: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextInput(
                      controller: passwordController,
                      label: 'Password',
                      enabled: true,
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          RegisterScreenCubit.get(context).ShowPassword();
                        },
                        icon: (RegisterScreenCubit.get(context).isShowPassword)
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      isPassword: !RegisterScreenCubit.get(context).isShowPassword,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextInput(
                      controller: phoneController,
                      label: 'Phone',
                      enabled: true,
                      prefixIcon: Icon(Icons.phone),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    ConditionalBuilder(
                      condition: state != RegisterNewUserLodingState,
                      builder: (context) {
                        return MyButton(
                            text: 'Register',
                            onPressed: (){
                              RegisterScreenCubit.get(context).RegisterNewUser(
                                context,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                              );
                            }
                        );
                      },
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
