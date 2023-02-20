import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/input_field.dart';
import '../../../core/widgets/my_button.dart';
import '../../../core/widgets/navigation.dart';
import '../register/register_page.dart';
import 'cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Container(
              margin: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Login now to communicate with friends',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextInput(
                      controller: emailController,
                      label: 'Email',
                      enabled: true,
                      prefixIcon: Icon(Icons.email),
                      textInputType: TextInputType.emailAddress,
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
                          LoginCubit.get(context).ShowPassword();
                        },
                        icon: (cubit.isShowPassword)
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      isPassword: !cubit.isShowPassword,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ConditionalBuilder(
                      condition: state != UserLoginLodingState,
                      builder: (context) {
                        return MyButton(
                          text: 'Login',
                          onPressed: () {
                            cubit.UserLogin(
                              context,
                                email: emailController.text,
                                password: passwordController.text);
                          },
                        );
                      },
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ?',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigation.navigatorTo(context, RegisterPage());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
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
