import 'package:cached_network_image/cached_network_image.dart';
import 'package:dandoun/bloc/app_cubit/app_cubit.dart';
import 'package:dandoun/bloc/home_cubit/home_cubit.dart';
import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/models/home_model.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/functions.dart';
import '../../details_artical/details_artical.dart';
import 'item_icon.dart';

class ItemList extends StatefulWidget {
  final Post post;

  ItemList(this.post);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.post.id==currentUser.phone || widget.post.type=="free"){

          pushPage(
              context: context, page: DetailsArticleScreen(id: widget.post.id!));
        }else {
          AppCubit.get(context).changeNav(2);
        }

      },
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width * .8,
        margin: const EdgeInsets.only(left: 32),
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
                  imageUrl: baseurlImage + widget.post.publisherImage!,
                  width: 29,
                  height: 29,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: Container(
                        width: 25,
                        height: 25,
                        child: const CircularProgressIndicator(
                          color: Colors.green,
                        )),
                  ),
                  errorWidget: (context, url, error) => Container(
                      width: 29,
                      height: 29,
                      child: const Center(
                          child: Icon(
                        Icons.error,
                        size: 25,
                      ))),
                ),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: CustomText(
                      family: "pnuB",
                      size: 8,
                      text: widget.post.publisherName!,
                      textColor: Colors.white,
                      weight: FontWeight.bold,
                      align: TextAlign.start),
                ),
                subtitle: CustomText(
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
                      imageUrl: baseurlImage + widget.post.photo!,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                        child: Container(
                            width: 25,
                            height: 25,
                            child: const CircularProgressIndicator(
                              color: Colors.green,
                            )),
                      ),
                      errorWidget: (context, url, error) => Container(
                          height: 110,
                          child: const Center(
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
                              onTap: () {},
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
                        text: widget.post.title!,
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
                        text: widget.post.description!,
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
                          HomeCubit.get(context).loadDownloadFileDialogShowing &&
                        HomeCubit.get(context).postDownloadId==widget.post.id
                              ?  SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    value: HomeCubit.get(context).precentDouble/100,
                                    color: Colors.white,
                                    backgroundColor: Theme.of(context).textTheme.bodyText1!.color!,
                                    strokeWidth: 3,
                                    valueColor:  const AlwaysStoppedAnimation(secondColor),

                                  ))
                              : IconItem(
                                  icon: "assets/icons/download.svg",
                                  onPress: () async {

                                    if(widget.post.id==currentUser.phone || widget.post.type=="free"){

                                      HomeCubit.get(context)
                                          .hasAcceptedPermissions()
                                          .then((value) async {
                                        if (value) {
                                          var path = await ExternalPath
                                              .getExternalStoragePublicDirectory(
                                              ExternalPath
                                                  .DIRECTORY_DOWNLOADS);

                                          HomeCubit.get(context).download2(

                                              baseurlMp3 + widget.post.sound!,
                                              path +
                                                  DateTime.now()
                                                      .millisecondsSinceEpoch
                                                      .toString() +
                                                  ".mp3",
                                              context: context,id: widget.post.id!,);
                                        } else {
                                          HomeCubit.get(context).getPermission();
                                        }
                                      });
                                    }else {
                                      AppCubit.get(context).changeNav(2);
                                    }




                                  },
                                ),
                          IconItem(
                            icon: "assets/icons/share.svg",
                            onPress: () {},
                          ),
                          IconItem(
                            isFav: true,
                            widget: Icon(
                              HomeCubit.get(context)
                                      .favorites
                                      .containsValue(widget.post.id)
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.white,
                              size: 17,
                            ),
                            icon: "assets/icons/star.svg",
                            onPress: () {
                              HomeCubit.get(context)
                                  .changeFavorite(widget.post.id!)
                                  .then((value) {});
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
