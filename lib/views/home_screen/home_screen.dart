import 'package:cached_network_image/cached_network_image.dart';
import 'package:dandoun/bloc/home_cubit/home_cubit.dart';
import 'package:dandoun/bloc/user_cubit/user_cubit.dart';
import 'package:dandoun/helpers/constants.dart';
import 'package:dandoun/helpers/functions.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/views/all_posts_screen/all_posts_screen.dart';
import 'package:dandoun/views/edite_profile_screen/edite_profile_screen.dart';
import 'package:dandoun/widget/custom_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'componts/container_bunner.dart';
import 'componts/item_list.dart';
import 'componts/titles_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeCubit.get(context).getHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return RefreshIndicator(

          onRefresh: () async=> HomeCubit.get(context).getHome(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              centerTitle: true,
              title: SvgPicture.asset(
                "assets/icons/logo.svg",
                height: 25,
              ),
              automaticallyImplyLeading: false,
              actions: [
                BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return GestureDetector(
                  onTap: () {
                    pushPage(context: context, page: EditProfileScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).textTheme.bodyText1!.color!, width: 1),
                        shape: BoxShape.circle),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: currentUser.imageUrl != null
                              ? baseurlImage + currentUser.imageUrl
                              : "notFound",
                          fit: BoxFit.fill,
                          height: 44,
                          width: 44,
                          placeholder: (context, url) => const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              color: homeColor,
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).textTheme.bodyText1!.color!,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Theme.of(context).backgroundColor,
                              ),
                            ),
                          ),
                        )),
                  ),
                );
  },
),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 24),
                //   child: Image.asset(
                //     "assets/images/person.png",
                //     width: 50,
                //     height: 50,
                //
                //   ),
                // ),
              ],
            ),
            body: HomeCubit.get(context).isLoadHome
                ? const SizedBox(
                    child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Divider(
                            height: 2,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        SizedBox(
                          height: 345,
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) {
                                return index ==
                                        HomeCubit.get(context)
                                            .model
                                            .postsOffer!
                                            .length
                                    ? SizedBox(
                                        height: 345,
                                        child: Center(
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.arrow_back_rounded,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              pushPage(
                                                  context: context,
                                                  page: AllPostsScreen(
                                                      "المنشورات المجانية", 0));
                                            },
                                          ),
                                        ),
                                      )
                                    : ItemList(HomeCubit.get(context)
                                        .model
                                        .postsOffer![index]);
                              },
                              itemCount: HomeCubit.get(context)
                                      .model
                                      .postsOffer!
                                      .length +
                                  1),
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          child: ContainerBanner(
                              image: baseurlImage +
                                  HomeCubit.get(context).model.sliders![0].image!,
                              title: HomeCubit.get(context)
                                  .model
                                  .sliders![0]
                                  .title!),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TitlesText(
                            onPress: () {
                              pushPage(
                                  context: context,
                                  page: AllPostsScreen("الأكثر سماعا", 1));
                            },
                            title: "الأكثر سماعا",
                            textButton: "الكل",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 345,
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) {
                                return ItemList(HomeCubit.get(context)
                                    .model
                                    .bestView![index]);
                              },
                              itemCount:
                                  HomeCubit.get(context).model.bestView!.length),
                        ),
                        // const SizedBox(
                        //   height: 49,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 24),
                        //   child: TitlesText(
                        //     onPress: () {},
                        //     title: "من اجلك",
                        //     textButton: "الكل",
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // SizedBox(
                        //   height: 345,
                        //   child: ListView.builder(
                        //       padding: const EdgeInsets.symmetric(horizontal: 24),
                        //       scrollDirection: Axis.horizontal,
                        //       shrinkWrap: true,
                        //       itemBuilder: (ctx, index) {
                        //         return ItemList(HomeCubit.get(context).model.bestView![index]);
                        //       },
                        //       itemCount:  HomeCubit.get(context).model.bestView!.length),
                        // ),
                        const SizedBox(
                          height: 87,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          child: ContainerBanner(
                              image: baseurlImage +
                                  HomeCubit.get(context).model.sliders![1].image!,
                              title: HomeCubit.get(context)
                                  .model
                                  .sliders![1]
                                  .title!),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TitlesText(
                            onPress: () {
                              pushPage(
                                  context: context,
                                  page: AllPostsScreen("جديد", 2));
                            },
                            title: "جديد",
                            textButton: "الكل",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 345,
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) {
                                return ItemList(HomeCubit.get(context)
                                    .model
                                    .listByTime![index]);
                              },
                              itemCount: HomeCubit.get(context)
                                  .model
                                  .listByTime!
                                  .length),
                        ),
                        const SizedBox(
                          height: 85,
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
