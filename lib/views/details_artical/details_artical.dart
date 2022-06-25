import 'package:cached_network_image/cached_network_image.dart';
import 'package:dandoun/bloc/post_cubit/post_cubit.dart';
import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/functions.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../helpers/constants.dart';
import '../play_vedio/play_vedio_screen.dart';
import 'componts/app_bar_details.dart';

class DetailsArticleScreen extends StatefulWidget {
final int id;


DetailsArticleScreen({required this.id});

  @override
  State<DetailsArticleScreen> createState() => _DetailsArticleScreenState();
}

class _DetailsArticleScreenState extends State<DetailsArticleScreen> {

  @override
  void initState() {
    super.initState();

    PostCubit.get(context).getPostDetails(id: widget.id,context: context  );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: PostCubit.get(context).loadPostDetails
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
              :   Column(
            children: [
               AppBarDetialsWidget(PostCubit.get(context).post!),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 304,
                          decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(
                              15)),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                baseurlImage + PostCubit.get(context).post!.photo!,

                                // width: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    Center(
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
                                    radius: 40.0,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineWidth: 3.5,
                                    percent: 0.7,
                                    center: GestureDetector(
                                        onTap: () {
                                          print("hshssh");
                                         pushPage(context: context,page: PlayVideoScreen(PostCubit.get(context).post!));
                                          setState(() {});
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
                          )

                      ),
                      const SizedBox(
                        height: 33,
                      ),

                       CustomText(
                          family: "pnuR",
                          size: 20,
                          text: PostCubit.get(context).post!.title!,
                          textColor: secondColor,
                          weight: FontWeight.bold,
                          align: TextAlign.start),
                      const SizedBox(
                        height: 20,
                      ),
                       Text(
                         PostCubit.get(context).post!.description!,
                        style: const TextStyle(
                          fontFamily: 'pnuL',
                          fontSize: 14,
                          color: Color(0xffe0e0e0),
                          fontWeight: FontWeight.w300,
                          height: 2.357142857142857,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


