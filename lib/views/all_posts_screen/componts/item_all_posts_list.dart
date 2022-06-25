import 'package:cached_network_image/cached_network_image.dart';
import 'package:dandoun/helpers/functions.dart';
import 'package:dandoun/views/navigation_screen/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../bloc/app_cubit/app_cubit.dart';
import '../../../bloc/home_cubit/home_cubit.dart';
import '../../../controller/router.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/styles.dart';
import '../../../models/home_model.dart';
import '../../../widget/custom_text.dart';
import '../../details_artical/details_artical.dart';
import '../../home_screen/componts/item_icon.dart';

class ItemAllPostList extends StatefulWidget {
  const ItemAllPostList({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  State<ItemAllPostList> createState() => _ItemAllPostListState();
}

class _ItemAllPostListState extends State<ItemAllPostList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.post.id==currentUser.phone || widget.post.type=="free"){

          pushPage(
              context: context, page: DetailsArticleScreen(id: widget.post.id!));
        }else {
          pushPage(
              context: context, page: NavigationScreen());
          AppCubit.get(context).changeNav(2);

        }
      },
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width ,
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: ListTile(
                horizontalTitleGap: 5,
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                minVerticalPadding: 13.0,
                contentPadding:
                const EdgeInsets.only(left: 0.0, right: 0.0, top: 0),
                leading: CachedNetworkImage(
                  imageUrl:
                  baseurlImage + widget.post.publisherImage!,
                  width: 29,
                  height: 29,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: Container(
                        width: 25,
                        height: 25,
                        child:
                        const CircularProgressIndicator(
                          color: Colors.green,
                        )),
                  ),
                  errorWidget: (context, url, error) =>
                      Container(
                          width: 29,
                          height: 29,
                          child: const Center(
                              child: Icon(
                                Icons.error,
                                size: 25,
                              ))),
                ),
                title:  Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CustomText(
                      family: "pnuB",
                      size: 8,
                      text: widget.post.publisherName!,
                      textColor: Colors.white,
                      weight: FontWeight.bold,
                      align: TextAlign.start),
                ),
                subtitle:  CustomText(
                    family: "pnuL",
                    size: 8,
                    text: widget.post.publisherSummary!,
                    textColor: textColor,
                    weight: FontWeight.w400,
                    align: TextAlign.start),
              ),
            ),
            SizedBox(
                height: 170,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                      baseurlImage + widget.post.photo!,

                      width: double.infinity,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                        child: Container(
                            width: 25,
                            height: 25,
                            child:
                            const CircularProgressIndicator(
                              color: Colors.green,
                            )),
                      ),
                      errorWidget: (context, url, error) =>
                          const SizedBox(
                              height: 110,
                              child: Center(
                                  child: Icon(
                                    Icons.error,
                                    size: 25,
                                  ))),
                    ),




                    Positioned(
                        left: 20,
                        bottom: 20,
                        child: CircularPercentIndicator(
                          radius: 35.0,
                          animation: true,
                          animationDuration: 1000,
                          lineWidth: 3.0,
                          percent: 0.7,
                          center: GestureDetector(
                              onTap: () {


                              },
                              child: const Icon(
                                Icons.play_arrow,
                                color: secondColor,
                                size: 25,
                              )),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.transparent,
                          progressColor: secondColor,
                        ))
                  ],
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomTextWithLines(
                        family: "pnuR",
                        size: 14,
                        text:
                        widget.post.title!,
                        textColor: secondColor,
                        weight: FontWeight.w400,
                        align: TextAlign.start,
                        lines: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      // width: double.infinity,
                      child: CustomTextWithLines(
                        family: "pnuL",
                        size: 11,
                        text:widget.post.description!,
                        textColor: Colors.white,
                        weight: FontWeight.w300,
                        align: TextAlign.start,
                        lines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconItem(
                            icon: "assets/icons/playlist.svg",
                            onPress: () {},
                          ),
                          IconItem(
                            icon: "assets/icons/download.svg",
                            onPress: () {},
                          ),
                          IconItem(
                            icon: "assets/icons/share.svg",
                            onPress: () {},
                          ),
                          IconItem(
                            isFav: true,
                            widget: Icon( HomeCubit.get(context).favorites.containsValue(widget.post.id)? Icons.star:Icons.star_border
                              ,color: Colors.white,size: 17,),
                            icon: "assets/icons/star.svg",
                            onPress: () {
                              HomeCubit.get(context).changeFavorite(widget.post.id!)
                                  .then((value){

                              });

                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}