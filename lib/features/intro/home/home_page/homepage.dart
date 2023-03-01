import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/model/social_model.dart';
import 'package:social_media/core/shared/icon_broken.dart';
import 'package:social_media/features/intro/home/layout_page/layout_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    elevation: 5.0,
                    child: CachedNetworkImage(
                      imageUrl:'${cubit.model.backGround}',
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Communicate with friends',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BuildPostItem(context,cubit.model),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 1,
                      ),
                  itemCount: 10),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget BuildPostItem(context,SocialAppModel model) {

  return Card(
    margin: EdgeInsets.all(8.0),
    elevation: 3,
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  '${model.image}',
              ),
            ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${model.name}',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        color: Colors.teal,
                        Icons.check_circle,
                        size: 15,
                      ),
                    ],
                  ),
                  Text(
                    'January 22,2023,10:45 AM',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 1.0,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Date of Completion with respect to a Project shall mean: (i) the date upon which such Project and all components thereof have been acquired or constructed and are capable of performing the functions for which they were intended, as evidenced by an Engineers’ Certificate filed with the Trustee and the Issuer',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: 14, height: 1, fontFamily: 'jannah'),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Container(
                child: MaterialButton(
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    '#Flutter Developer',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.teal, height: 1),
                  ),
                ),
                height: 15,
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(8.0),
          elevation: 5.0,
          child: CachedNetworkImage(
            imageUrl:
            '${model.backGround}',
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          IconBroken.Heart,
                          color: Colors.teal,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '1200',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          IconBroken.Chat,
                          color: Colors.teal,
                          size: 18,
                        ),
                        Text(
                          '189 Comments',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 1.0,
          color: Colors.grey,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          '${model.image}',
                        ),
                        radius: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Write Comments...',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        IconBroken.Heart,
                        color: Colors.teal,
                        size: 18,
                      ),
                      Text(
                        'Love',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    ),
  );
}
