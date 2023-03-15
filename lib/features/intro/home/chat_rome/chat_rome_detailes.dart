import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/model/social_model.dart';
import 'package:social_media/core/shared/icon_broken.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';

class ChatRomePage extends StatelessWidget {
  SocialAppModel? model;

  ChatRomePage({this.model});

  TextEditingController messageSendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      LayoutCubit.get(context).GetMessageInChat(
          senderId: LayoutCubit.get(context).userModel.uId.toString(),
          receiverId: model?.uId.toString());
      return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(IconBroken.Arrow___Left_2),
              ),
              titleSpacing: 0.0,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('${model?.image}'),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('${model?.name}'),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView.separated(
                      //reverse: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (cubit.messageInChat[index].senderId ==
                            cubit.userModel.uId) {
                          return MyMessage(
                              mess: cubit.messageInChat[index].textMessage);
                        }
                        return SenderMessage(
                            mess: cubit.messageInChat[index].textMessage);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                      itemCount: cubit.messageInChat.length),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(
                        child: AutoDirection(
                          text: messageSendController.text,
                          child: TextFormField(
                            onChanged: (value) {
                              cubit.EmitState();
                            },
                            controller: messageSendController,
                            maxLines: 2,
                            minLines: 1,
                            decoration: InputDecoration(
                                hintText: 'write your message',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.SendMessage(
                                senderId: cubit.userModel.uId.toString(),
                                receiverId: model?.uId.toString(),
                                date: DateTime.now().toString(),
                                textMessage: messageSendController.text);
                            messageSendController.text = "";
                          },
                          icon: Icon(
                            IconBroken.Send,
                            color: Colors.teal,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget MyMessage({required String? mess}) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: 80.0, right: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.teal[100]),
        child: Text(
          '$mess',
        ),
      ),
    );
  }

  Widget SenderMessage({required String? mess}) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: 16.0, right: 80.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.grey[300]),
        child: Text(
          '$mess',
        ),
      ),
    );
  }
}
