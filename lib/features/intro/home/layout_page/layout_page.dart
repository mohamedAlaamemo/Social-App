import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/network/local/cache_helper.dart';
import 'package:social_media/core/shared/icon_broken.dart';
import 'package:social_media/core/widgets/navigation.dart';
import 'package:social_media/core/widgets/show_toast.dart';
import 'package:social_media/features/intro/home/add_post/add_post.dart';
import 'package:social_media/features/intro/login/login_page.dart';

import 'layout_cubit.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is LayoutAddPostState)
          {
            Navigation.navigatorTo(context,AddPost());
          }
      },
      builder: (context, state) {
        var cubit =LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex]
            ),
            actions: [
              IconButton(
                  icon: Icon(IconBroken.Notification),
                onPressed: (){},
              ),

              IconButton(
                icon: Icon(IconBroken.Search),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(IconBroken.Logout),
                onPressed: (){
                  CacheHelper.removeDate(key: 'uId');
                  Navigation.navigatorAndFinished(context, LoginPage());
                  ShowToast(mes: 'LogOut Successfully');
                },
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
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
                  label: 'Post',
                  icon: Icon(IconBroken.Paper_Upload)
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
