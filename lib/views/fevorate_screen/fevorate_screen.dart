import 'package:dandoun/bloc/home_cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post_cubit/post_cubit.dart';
import '../../helpers/styles.dart';
import '../../models/home_model.dart';
import '../../widget/custom_text.dart';
import '../../widget/text_widget.dart';
import '../all_posts_screen/componts/item_all_posts_list.dart';

class FevorateScreen extends StatelessWidget {
  const FevorateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(

      appBar: AppBar(

        title: CustomText(
          weight: FontWeight.w500,
          text: "المفضلة",
          family: "pnuB",
          size: 16,
          textColor: Theme.of(context).textTheme.bodyText1!.color!,
          align: TextAlign.start,
        ),
       automaticallyImplyLeading: false,
      ),
      
      body: HomeCubit.get(context).loadFav
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      )
          :HomeCubit.get(context).favoritesData.isNotEmpty
          ? ListView.builder(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {

            Post post=HomeCubit.get(context).favoritesData[index].post!;
            return ItemAllPostList(post: post);
          },
          itemCount: HomeCubit.get(context).favoritesData.length):
      Center(
        child: TextWidget3(
          color: Theme.of(context).textTheme.bodyText1!.color!,
          fontSize: 18,
          text: "لاتوجد عناصر في المفضلة",
          fontFamliy: "pnuR",
          isCustomColor: true,
          alginText: TextAlign.center,
          lines: 1,
        ),
      ),
    );
  },
);
  }
}