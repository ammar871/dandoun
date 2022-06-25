import 'dart:convert';
import 'package:audio_service/audio_service.dart';
import 'package:dandoun/helpers/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../../models/home_model.dart';
import 'package:just_audio/just_audio.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  static PostCubit get(context) => BlocProvider.of<PostCubit>(context);

  bool loadAllPosts = false;
  List<Post> posts = [];

  getAllPosts({type}) async {
    posts = [];
    loadAllPosts = true;
    emit(GetPostsLoad());
    var request =
        http.MultipartRequest('GET', Uri.parse(baseUrl + '/post/get-posts'));
    request.fields.addAll({'type': type.toString()});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);

      jsonData.forEach((v) {
        posts.add(Post.fromJson(v));
      });

      loadAllPosts = false;
      emit(GetPostsLoad());
    } else {
      print(response.statusCode.toString());

      loadAllPosts = false;
      emit(GetPostsLoad());
    }
  }

  Post? post;
  bool loadPostDetails = false;

  getPostDetails({id, context}) async {
    loadPostDetails = true;
    emit(GetPostDetailsLoad());

    var request = http.MultipartRequest(
        'GET', Uri.parse(baseUrl + '/post/get-post-by-id'));
    request.fields.addAll({'id': id.toString()});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(response.statusCode.toString());

      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);

      post = Post.fromJson(jsonData);
      print("before updated" + post!.views!.toString());
      updateViewPost(id: post!.id!, view: post!.views!);
      loadPostDetails = false;
      emit(GetPostDetailsLoad());
    } else {
      print(response.statusCode.toString());
      loadPostDetails = false;
      emit(GetPostDetailsLoad());
    }
  }

  updateViewPost({id, view}) async {
    view++;
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + '/post/update-post-view'));
    request.fields.addAll({'view': view.toString(), 'id': id.toString()});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      post = Post.fromJson(jsonData);
      print(
          response.statusCode.toString() + "updated" + post!.views!.toString());
      emit(GetPostDetailsLoad());
    } else {
      print(response.statusCode.toString() + "no");
      emit(GetPostDetailsLoad());
    }
  }

  List<Post> searchPosts = [];
  bool loadPostSearch = false;

  searchPostsData({name}) async {
    searchPosts = [];
    loadPostSearch = true;
    emit(SearchProductDataLoad());
    var request =
        http.MultipartRequest('GET', Uri.parse(baseUrl + searchProductsPoint));
    request.fields.addAll({'name': name});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      print(jsonData);
      searchPosts = [];
      jsonData.forEach((v) {
        searchPosts.add(Post.fromJson(v));
      });
      loadPostSearch = false;
      emit(SearchProductDataSuccess());
    } else {
      loadPostSearch = false;
      print("errrrrrrrrrror");
      emit(SearchProductDataError());
    }
  }

  // AudioPlayer? audioPlayer;
  //
  // PlayerState? playerState;

  bool loadPlaying = false;
  bool loadPause = false;
  Duration? currentPosition = Duration(seconds: 0);

  Duration? duration = Duration(seconds: 0);

  initAudioPlayer() async {
    print("starrrrrrrrrrrrrrrrrt");
    duration =
        audioHandler.mediaItem.value!.duration ?? const Duration(seconds: 0);

    audioHandler.playbackState.listen((event) {
      print(event.updatePosition.toString()+"wllllllllllllllll");
      if(event.playing){
        duration=event.updatePosition;
        currentPosition =audioHandler.playbackState.value.position;
      }

      if(event.processingState==AudioProcessingState.completed){
        audioHandler.pause();

      }
      emit(ListenPlayerState());
    });




print(duration!.inSeconds.toDouble().toString() +"ef"+currentPosition!.inSeconds.toDouble().toString());
    emit(ListenPlayerState());




  }

  // Stream<MediaState> get _mediaStateStream =>
  //     Rx.combineLatest2<MediaItem?, Duration, MediaState>(
  //         audioHandler.mediaItem,
  //         AudioService.position,
  //             (mediaItem, position) => MediaState(mediaItem, position));



  onChangeDuration({value}) {
    audioHandler.seek(Duration(seconds: value.toInt()));
  }

  playSound({url}) async {
    loadPlaying = true;
    audioHandler.play();
    print("lisssssssss"+audioHandler.playbackState.value.position.toString());
    emit(ListenPlayerState());
    /*   int result = await audioPlayer!.play(url, stayAwake: true);
    if (result == 1) {
      print("success" + result.toString());



      audioHandler.play();

      emit(AudioPlayerPlayedSuccess());
    } else {
      loadPlaying = false;

      print("Error" + result.toString());
      emit(AudioPlayerPlayedError());
    }*/
  }

  pauseSound() async {
    loadPlaying = false;
    emit(ListenPlayerState());
    audioHandler.pause();

    // if (result == 1) {
    //   print("success" + result.toString());
    //   audioHandler.pause();
    //   emit(AudioPlayerPauseSuccess());
    // } else {
    //   loadPlaying = true;
    //   print("Error" + result.toString());
    emit(AudioPlayerPauseError());
  }

  stopSound() async {
    audioHandler.stop();
    emit(AudioPlayerStopSuccess());
    // loadPlaying = true;
    // int result = await audioPlayer!.stop();
    // if (result == 1) {
    //   loadPlaying = false;
    //   audioHandler.pause();
    //   print("success" + result.toString());
    //   emit(AudioPlayerStopSuccess());
    // } else {
    //   loadPlaying = false;
    //   print("Error" + result.toString());
    //   emit(AudioPlayerStopError());
    // }
  }
}
