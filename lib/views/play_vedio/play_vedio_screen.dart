import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dandoun/helpers/functions.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/main.dart';
import 'package:dandoun/views/home_screen/componts/item_icon.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_cubit/home_cubit.dart';
import '../../bloc/post_cubit/post_cubit.dart';
import '../../helpers/constants.dart';
import '../../models/home_model.dart';
import '../../servies/audio_handler.dart';
import '../../servies/page_manager.dart';
import 'componts/icon_buttons_controller.dart';
import 'componts/tab_bar_playing_vedio.dart';

class PlayVideoScreen extends StatefulWidget {
  final Post post;

  const PlayVideoScreen(this.post, {Key? key}) : super(key: key);

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  // late  AudioPlayerHandler audioHandler;
  @override
  void initState() {
    // audioHandler= AudioPlayerHandler();

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    // PostCubit.get(context).initAudioPlayer(item: item);
    print(baseurlMp3 + widget.post.sound!);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
    // PostCubit.get(context).audioPlayer!.release();
    // PostCubit.get(context).audioPlayer!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var item = MediaItem(
      id: baseurlMp3 + widget.post.sound!,
      album: 'Album name',
      title: widget.post.title!,
      artist: widget.post.publisherName!,
      duration: progressNotifier.value.total,
      artUri: Uri.parse(baseurlImage + widget.post.photo!),
    );
    audioHandler.playMediaItem(item);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              color: backgroundColor,
              padding: const EdgeInsets.only(
                  top: 60, left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      // PostCubit.get(context)
                      //     .audioHandler
                      //     .release()
                      //     .then((value) {
                      //   PostCubit.get(context).audioPlayer!.dispose();
                      // audioHandler.pause();
                      pop(context);
                      // });
                    },
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
                        child: DetailsArtical(widget.post),
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
                                ValueListenableBuilder<ProgressBarState>(
                                  valueListenable: progressNotifier,
                                  builder: (_, value, __) {
                                    return Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: ProgressBar(
                                            thumbColor: secondColor,
                                            bufferedBarColor:
                                            secondColor.withOpacity(.5),
                                            progressBarColor: secondColor,
                                            progress: value.current,
                                            buffered: value.buffered,
                                            total: value.total,
                                            onSeek: audioHandler.seek,
                                          ),
                                        ),

                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 20),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       CustomText(
                                        //           family: "pnuB",
                                        //           size: 8,
                                        //           text: PostCubit.get(context)
                                        //               .duration!
                                        //               .inSeconds
                                        //               .remainder(60)
                                        //               .toString() +
                                        //               " : " +
                                        //               PostCubit.get(context)
                                        //                   .duration!
                                        //                   .inMinutes
                                        //                   .remainder(60)
                                        //                   .toString(),
                                        //           textColor: Colors.white,
                                        //           weight: FontWeight.bold,
                                        //           align: TextAlign.start),
                                        //       CustomText(
                                        //           family: "pnuB",
                                        //           size: 8,
                                        //           text: PostCubit.get(context)
                                        //               .currentPosition!
                                        //               .inSeconds
                                        //               .remainder(60)
                                        //               .toString() +
                                        //               " : " +
                                        //               PostCubit.get(context)
                                        //                   .currentPosition!
                                        //                   .inMinutes
                                        //                   .remainder(60)
                                        //                   .toString(),
                                        //           textColor: Colors.white,
                                        //           weight: FontWeight.bold,
                                        //           align: TextAlign.start),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    );
                                  },
                                ),
                                ValueListenableBuilder<ButtonState>(
                                  valueListenable: buttonNotifier,
                                  builder: (_, value, __) {
                                    return SizedBox(
                                      height: 50,
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            IconButtonController(
                                              onPress: () {},
                                              icon: Icons.skip_next,
                                              color: const Color(0xff848482),
                                            ),
                                            IconButtonController(
                                              onPress: () {
                                                int residual = progressNotifier
                                                    .value.total.inSeconds
                                                    .toInt() - progressNotifier
                                                    .value.current.inSeconds
                                                    .toInt();

                                                if (residual > 10) {
                                                  audioHandler.seek(Duration(
                                                      seconds: progressNotifier
                                                          .value
                                                          .current
                                                          .inSeconds
                                                          .toInt() +
                                                          10));
                                                } else {
                                                  audioHandler.seek(Duration(
                                                      seconds: residual));
                                                }
                                              },
                                              icon: Icons.forward_10,
                                              color: secondColor,
                                            ),
                                            value == ButtonState.loading
                                                ? const SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Center(
                                                child:
                                                CircularProgressIndicator(
                                                  color: secondColor,
                                                ),
                                              ),
                                            )
                                                : IconButtonController(
                                              onPress: () {
                                                value ==
                                                    ButtonState
                                                        .playing
                                                    ? audioHandler.pause()
                                                    : audioHandler.play();
                                              },
                                              icon: value ==
                                                  ButtonState.playing
                                                  ? Icons
                                                  .pause_circle_outline
                                                  : Icons
                                                  .play_circle_outline,
                                              color: secondColor,
                                              size: 50,
                                            ),
                                            IconButtonController(
                                              onPress: () {
                                                if (progressNotifier
                                                    .value.current.inSeconds
                                                    .toInt() >
                                                    10) {
                                                  audioHandler.seek(Duration(
                                                      seconds: progressNotifier
                                                          .value
                                                          .current
                                                          .inSeconds
                                                          .toInt() -
                                                          10));
                                                } else {
                                                  audioHandler.seek(Duration(
                                                      seconds: progressNotifier
                                                          .value
                                                          .current
                                                          .inSeconds
                                                          .toInt()));
                                                }
                                              },
                                              icon: Icons.replay_10,
                                              color: secondColor,
                                            ),
                                            IconButtonController(
                                              onPress: () {
                                                PostCubit.get(context)
                                                    .onChangeDuration(
                                                    value: 10);
                                              },
                                              icon: Icons.skip_previous,
                                              color: const Color(0xff848482),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );

                                    // switch (value) {
                                    //   case ButtonState.loading:
                                    //     return Container(
                                    //       margin: const EdgeInsets.all(8.0),
                                    //       width: 32.0,
                                    //       height: 32.0,
                                    //       color: Colors.white,
                                    //       child: const CircularProgressIndicator(),
                                    //     );
                                    //   case ButtonState.paused:
                                    //     return IconButton(
                                    //       icon: const Icon(
                                    //         Icons.play_arrow,
                                    //         color: Colors.white,
                                    //       ),
                                    //       iconSize: 32.0,
                                    //       onPressed: audioHandler.play,
                                    //     );
                                    //   case ButtonState.playing:
                                    //     return IconButton(
                                    //       icon: const Icon(Icons.pause,
                                    //           color: Colors.white),
                                    //       iconSize: 32.0,
                                    //       onPressed: audioHandler.pause,
                                    //     );
                                    // }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Spacer(),
                                 ContainerActions(widget.post),
                              ],
                            ),
                          )),

                      /*
                     *
                     *
                     *
                     *
                     *
                     * */
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
      ),
    );
  }
}

class ContainerActions extends StatefulWidget {
  final Post post;


  ContainerActions(this.post);

  @override
  State<ContainerActions> createState() => _ContainerActionsState();
}

class _ContainerActionsState extends State<ContainerActions> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
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





              },
            ),
              IconItem(
                icon: "assets/icons/share.svg",
                onPress: () {},
              ),
              IconItem(
                icon:   "assets/icons/star.svg",
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
                onPress: () {
                  HomeCubit.get(context)
                      .changeFavorite(widget.post.id!)
                      .then((value) {});
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class DetailsArtical extends StatelessWidget {
  final Post post;

  DetailsArtical(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 304,
          child: CachedNetworkImage(
            imageUrl: baseurlImage + post.photo!,
            height: 304,
            width: double.infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) =>
            const Center(
              child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
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
        ),
        const SizedBox(
          height: 54,
        ),
        CustomTextWithLines(
            family: "pnuR",
            size: 12,
            lines: 1,
            text: post.title!,
            textColor: Colors.white,
            weight: FontWeight.bold,
            align: TextAlign.start),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomTextWithLines(
              family: "pnuR",
              size: 20,
              lines: 2,
              text: post.description!,
              textColor: secondColor,
              weight: FontWeight.bold,
              align: TextAlign.center),
        ),
        const SizedBox(
          height: 14,
        ),
        CustomTextWithLines(
            family: "pnuL",
            size: 12,
            lines: 1,
            text: post.publisherName!,
            textColor: Colors.white,
            weight: FontWeight.bold,
            align: TextAlign.start),
        const SizedBox(
          height: 215,
        ),
      ],
    );
  }
}

class MediaState {
  final MediaItem? mediaItem;
  final Duration position;

  MediaState(this.mediaItem, this.position);
}
