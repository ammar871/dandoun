import 'package:cached_network_image/cached_network_image.dart';
import 'package:dandoun/bloc/post_cubit/post_cubit.dart';
import 'package:dandoun/helpers/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../controller/router.dart';
import '../../helpers/constants.dart';
import '../../helpers/styles.dart';
import '../../models/home_model.dart';
import '../../widget/custom_text.dart';
import '../home_screen/componts/item_icon.dart';
import '../home_screen/componts/item_list.dart';
import 'componts/item_all_posts_list.dart';

class AllPostsScreen extends StatefulWidget {
  final String bar;
  final int type;

  AllPostsScreen(this.bar, this.type);

  @override
  State<AllPostsScreen> createState() => _AllPostsScreenState();
}

class _AllPostsScreenState extends State<AllPostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostCubit.get(context).getAllPosts(type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: homeColor,
            title: CustomText(
              weight: FontWeight.w500,
              text: widget.bar,
              family: "pnuB",
              size: 16,
              textColor: Theme.of(context).textTheme.bodyText1!.color!,
              align: TextAlign.start,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).textTheme.bodyText1!.color!,
              ),
              onPressed: () {
                pop(context);
              },
            ),
          ),
          body: PostCubit.get(context).loadAllPosts
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {

                    Post post=PostCubit.get(context).posts[index];
                    return ItemAllPostList(post: post);
                  },
                  itemCount: PostCubit.get(context).posts.length),
        );
      },
    );
  }
}


