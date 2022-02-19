import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:video_player/video_player.dart';

import 'componts/app_bar_details.dart';

class DetailsArticleScreen extends StatefulWidget {
  const DetailsArticleScreen({Key? key}) : super(key: key);

  @override
  State<DetailsArticleScreen> createState() => _DetailsArticleScreenState();
}

class _DetailsArticleScreenState extends State<DetailsArticleScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        print("jsjsjs");
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      }).onError((error, stackTrace) {
        print("error");
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarDetialsWidget(),
          SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 304,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: _controller!.value.isInitialized
                        ? Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius:BorderRadius.circular(15),
                                child: AspectRatio(

                                  aspectRatio: _controller!.value.aspectRatio,
                                  child: VideoPlayer(_controller!),
                                ),
                              ),
                              Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineWidth: 3.0,
                                    percent: 0.7,
                                    center: GestureDetector(
                                        onTap: () {
                                          print("hshssh");
                                          Navigator.pushNamed(context, playing);
                                          setState(() {});
                                        },
                                        child: Icon(
                                          _controller!.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: secondColor,
                                          size: 19,
                                        )),
                                    circularStrokeCap: CircularStrokeCap.butt,
                                    backgroundColor: Colors.transparent,
                                    progressColor: secondColor,
                                  ))
                            ],
                          )
                        : Container(),
                  ),
                  const SizedBox(
                    height: 33,
                  ),

                  const CustomText(
                      family: "pnuR",
                      size: 20,
                      text: "الأشياء المدهشة التي سيقدمها لنا الميتافيرس. وما الذي يتطلبه الأمر؟",
                      textColor: secondColor,
                      weight: FontWeight.bold,
                      align: TextAlign.start),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'المبدعون في عالم التقنية لديهم رؤى تتنبأ بعالم آخر مغاير لعالمنا الواقعي. الناس ستحيا فيه حياة كانت في السابق مجرد ضرب من الخيال.\nالمبدعون في عالم التقنية لديهم رؤى تتنبأ بعالم آخر مغاير لعالمنا الواقعي. الناس ستحيا فيه حياة كانت في السابق مجرد ضرب من الخيال.',
                    style: TextStyle(
                      fontFamily: 'pnuL',
                      fontSize: 14,
                      color: Color(0xffe0e0e0),
                      fontWeight: FontWeight.w300,
                      height: 2.357142857142857,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


