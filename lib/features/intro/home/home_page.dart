import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/shared/icon_broken.dart';
import 'package:social_media/features/intro/home/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit =HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Social Home',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'jannah'
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(IconBroken.Home)
              ),
              BottomNavigationBarItem(
                  label: 'Chats',
                  icon: Icon(IconBroken.Chat)
              ),
              BottomNavigationBarItem(
                  label: 'Users',
                  icon: Icon(IconBroken.User)
              ),
              BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Icon(IconBroken.Setting)
              ),
            ],
            onTap: (index) {
              cubit.ChangeScreen(index: index);
            },
          ),
        );
      },
    );
  }
}
