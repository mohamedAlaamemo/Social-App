
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/widgets/input_field.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';

import '../../../../core/shared/icon_broken.dart';

class EditProfilePage extends StatelessWidget {
   EditProfilePage({Key? key}) : super(key: key);
  var nameController=TextEditingController();
  var bioController=TextEditingController();
  var phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is LayoutGetImageSuccessState)
          {
            LayoutCubit.get(context).UploadImageProfile(
                name: nameController.text,
                bio: bioController.text,
                phone: phoneController.text,
            );
          }
        if(state is LayoutGetImageCoverSuccessState)
          {
            LayoutCubit.get(context).UploadImageCover(
              name: nameController.text,
              bio: bioController.text,
              phone: phoneController.text,
            );
          }
      },
      builder: (context, state) {
        var cubit =LayoutCubit.get(context);
        nameController.text=cubit.userModel.name!;
        bioController.text=cubit.userModel.bio!;
        phoneController.text=cubit.userModel.phone!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              cubit.imageProfile=null;
              cubit.imageCover=null;
              Navigator.pop(context);
            },icon:Icon(IconBroken.Arrow___Left_2)),
            titleSpacing: 0.0,
            title: Text(
                'Edit Profile'
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    cubit.UpDateUser(
                        name: nameController.text,
                        bio: bioController.text,
                        phone: phoneController.text);
                  },
                  child: Text(
                    'Update'
                  )
              ),
              SizedBox(width: 8,)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  if(state is LayoutUpDateUserLodingState)
                    LinearProgressIndicator(),
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Card(
                                elevation: 0.0,
                                child: CachedNetworkImage(
                                  imageUrl: '${cubit.userModel.backGround}',
                                  placeholder: (context, url) =>
                                      Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  width: double.infinity,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: (){
                                  cubit.GetImageCover();
                                },
                                icon: CircleAvatar(
                                    child: Icon(IconBroken.Camera),
                                  radius: 20.0,
                                ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor,
                              child: CircleAvatar(
                                backgroundImage:CachedNetworkImageProvider(
                                  '${cubit.userModel.image}'
                                ),
                                radius: 45,
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                cubit.GetImage();
                              },
                              icon: CircleAvatar(
                                child: Icon(IconBroken.Camera),
                                radius: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  MyTextInput(
                      controller: nameController,
                    textInputType: TextInputType.name,
                    label: 'Name',
                    prefixIcon: Icon(IconBroken.User),
                  ),
                  SizedBox(height: 10,),
                  MyTextInput(
                      controller: bioController,
                    textInputType: TextInputType.text,
                    label: 'Bio',
                    prefixIcon: Icon(IconBroken.Info_Circle),

                  ),
                  SizedBox(height: 10,),
                  MyTextInput(
                      controller: phoneController,
                    textInputType: TextInputType.phone,
                    label: 'phone',
                    prefixIcon: Icon(IconBroken.Call),

                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
