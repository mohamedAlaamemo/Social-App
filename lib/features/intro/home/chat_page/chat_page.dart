import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/model/social_model.dart';
import 'package:social_media/core/widgets/navigation.dart';
import 'package:social_media/features/intro/home/chat_rome/chat_rome_detailes.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit =LayoutCubit.get(context);
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
              onTap: (){
                Navigation.navigatorTo(context, ChatRomePage(model: cubit.allUsersList[index],));
              },
              child: UserItem(model: cubit.allUsersList[index])),
          separatorBuilder: (context, index) =>
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
          itemCount: cubit.allUsersList.length,
        );
      },
    );
  }


  Widget UserItem({required SocialAppModel model}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    '${model.image}'
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  '${model.name}'
              ),
            ],
          ),
        ],
      ),
    );
  }
}
