import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'item_icon.dart';

class ItemList extends StatefulWidget {
  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, details);
      },
      child: Container(
        height: 345,
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
                leading: Image.asset(
                  "assets/images/img2.png",
                  width: 29,
                  height: 29,
                  fit: BoxFit.cover,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: CustomText(
                      family: "pnuB",
                      size: 8,
                      text: "وول ستريت جورنال",
                      textColor: Colors.white,
                      weight: FontWeight.bold,
                      align: TextAlign.start),
                ),
                subtitle: const CustomText(
                    family: "pnuL",
                    size: 8,
                    text: "ساره نيدل مان",
                    textColor: textColor,
                    weight: FontWeight.w400,
                    align: TextAlign.start),
              ),
            ),
            SizedBox(
              height: 180,
              child: _controller!.value.isInitialized
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
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
                                    print("hshssh");
                                    _controller!.play();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    _controller!.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: secondColor,
                                    size: 25,
                                  )),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.transparent,
                              progressColor: secondColor,
                            ))
                      ],
                    )
                  : Container(),
            ),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: CustomTextWithLines(
                        family: "pnuR",
                        size: 14,
                        text:
                            "لأشياء المدهشة التي سيقدمها لنا  الميتافيرس . وما ",
                        textColor: secondColor,
                        weight: FontWeight.w400,
                        align: TextAlign.start,
                        lines: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const SizedBox(
                      // width: double.infinity,
                      child: CustomTextWithLines(
                        family: "pnuL",
                        size: 11,
                        text:
                            "المبدعون في عالم التقنية لديهم رؤى تتنبأ بعالم آخر مغاير لعالمنا الواقعي. الناس ستحيا فيه حياة كانت في السابق مجرد ضرب من الخيال.",
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
                            icon: "assets/icons/star.svg",
                            onPress: () {},
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
