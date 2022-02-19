import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/views/home_screen/componts/item_icon.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'componts/custom_track_shape.dart';
import 'componts/icon_buttons_controller.dart';
import 'componts/tab_bar_playing_vedio.dart';

class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({Key? key}) : super(key: key);

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  VideoPlayerController? _controller;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // ignore: avoid_print
        print("jsjsjs");
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      }).onError((error, stackTrace) {
        // ignore: avoid_print
        print("error");
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: backgroundColor,
            padding: const EdgeInsets.only(top: 60, left: 10, right: 10,bottom:10 ),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
                const Spacer(),
                TabBarPlayingVedio(tabController: _tabController),
                const Spacer(),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 304,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: AspectRatio(
                                aspectRatio: _controller!.value.aspectRatio,
                                child: VideoPlayer(_controller!),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 54,
                          ),
                          const CustomTextWithLines(
                              family: "pnuR",
                              size: 12,
                              lines: 1,
                              text: "سارة نيدل مان",
                              textColor: Colors.white,
                              weight: FontWeight.bold,
                              align: TextAlign.start),
                          const SizedBox(
                            height: 14,
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextWithLines(
                                family: "pnuR",
                                size: 20,
                                lines: 2,
                                text:
                                    "الأشياء المدهشة التي سيقدمها لنا الميتافيرس. وما الذي يتطلبه الأمر؟",
                                textColor: secondColor,
                                weight: FontWeight.bold,
                                align: TextAlign.center),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const CustomTextWithLines(
                              family: "pnuL",
                              size: 12,
                              lines: 1,
                              text: "سارة نيدل مان",
                              textColor: Colors.white,
                              weight: FontWeight.bold,
                              align: TextAlign.start),
                          const SizedBox(
                            height: 215,
                          ),

                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    trackShape: CustomTrackShape(),
                                  ),
                                  child: Slider(
                                    value: 10,
                                    min: 0,
                                    max: 100,
                                    activeColor: secondColor,
                                    inactiveColor: Colors.white,
                                    onChanged: (double value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    CustomText(
                                        family: "pnuB",
                                        size: 8,
                                        text: "00:00",
                                        textColor: Colors.white,
                                        weight: FontWeight.bold,
                                        align: TextAlign.start),
                                    CustomText(
                                        family: "pnuB",
                                        size: 8,
                                        text: "00:00",
                                        textColor: Colors.white,
                                        weight: FontWeight.bold,
                                        align: TextAlign.start),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButtonController(
                                        onPress: () {},
                                        icon: Icons.skip_next,
                                        color: const Color(0xff848482),
                                      ),
                                      IconButtonController(
                                        onPress: () {},
                                        icon: Icons.forward_10,
                                        color: secondColor,
                                      ),
                                      IconButtonController(
                                        onPress: () {},
                                        icon: Icons.play_circle_outline,
                                        color: secondColor,
                                        size: 50,
                                      ),
                                      IconButtonController(
                                        onPress: () {},
                                        icon: Icons.replay_10,
                                        color: secondColor,
                                      ),
                                      IconButtonController(
                                        onPress: () {},
                                        icon: Icons.skip_previous,
                                        color: const Color(0xff848482),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 40,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                color: backgroundColor,
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
                        ))
                  ],
                ),

                // second tab bar view widget
                const Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



