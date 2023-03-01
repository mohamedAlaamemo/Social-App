import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/shared/icon_broken.dart';
import 'package:social_media/core/widgets/my_button.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';

class SittingPage extends StatelessWidget {
  const SittingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit =LayoutCubit.get(context);
    return Column(
      children: [
        Container(
          height: 200,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  elevation: 0.0,
                  child: CachedNetworkImage(
                    imageUrl:'${cubit.model.backGround}',
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  backgroundImage:NetworkImage(
                    '${cubit.model.image}'
                  ),
                  radius: 35,
                ),
              ),
            ],
          ),
        ),
        Text(
          '${cubit.model.name}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 5,),
        Text(
          '${cubit.model.bio}',
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '100',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Posts',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      fontFamily: 'jannah'
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '256',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Photos',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      fontFamily: 'jannah'
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '10K',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Followers',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      fontFamily: 'jannah'
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '64',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'Followings',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      fontFamily: 'jannah'
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: OutlinedButton(
                   onPressed: (){},
                   child: Text(
                     'Add Photo'
                   ),
                ),
              ),
              OutlinedButton(
                onPressed: (){},
                child: Icon(IconBroken.Edit),
              ),
            ],
          ),
        ),
      ],
    );
  },
);
  }
}