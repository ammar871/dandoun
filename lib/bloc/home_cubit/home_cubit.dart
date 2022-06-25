import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:dandoun/helpers/constants.dart';
import 'package:dandoun/models/home_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../../models/favoriteModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  double precentDouble = 0.0;
  bool loadDownloadFileDialogShowing = false;
  HomeModel model = HomeModel();
  bool isLoadHome = false;
  Map<int, int> favorites = {};
  bool load = false;
  List<ResponseFavorite> favoritesData = [];
  bool loadFav = false;
  int postDownloadId = -1;

  getHome() async {
    isLoadHome = true;
    emit(GetHomeDataLoad());
    var request = http.Request('GET', Uri.parse(baseUrl + '/dashboard-home'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      model = HomeModel.fromJson(jsonData);
      print(model.bestView!.length.toString());
      isLoadHome = false;
      emit(GetHomeDataSuccess());
    } else {
      print(response.statusCode.toString());
      isLoadHome = false;
      emit(GetHomeDataError());
    }
  }

  getFavorites() async {
    loadFav = true;
    favoritesData = [];
    emit(GetFavGetDataLoad());

    var headers = {
      "Authorization": token,

      // If  needed
    };
    var request = http.MultipartRequest(
        'GET', Uri.parse(baseUrl + '/favorite/get-Favorites'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      print("" + response.statusCode.toString());
      favoritesData = [];
      jsonData.forEach((v) {
        favoritesData.add(ResponseFavorite.fromJson(v));
      });
      if(favoritesData.isNotEmpty){

        favoritesData.forEach((element) {
          // print(element.post!.id!.toString() + "qddddd");

          favorites.addAll({element.post!.id!: element.post!.id!});
        });
      }


      loadFav = false;
      emit(GetFavLoadDataSuccess(favoritesData));
    } else {
      print("errrrrrrrrrror" + response.statusCode.toString());
      emit(GetFavLoadDataError());
    }
  }

  Future changeFavorite(int productId) async {
    favorites.containsValue(productId)
        ? favorites.remove(productId)
        : favorites.addAll({productId: productId});

    emit(AddFavSuccessLoad());

    var headers = {'Authorization': token};
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + addFavPoint));
    request.fields.addAll({
      "PostId": productId.toString(),
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);

      print(jsonData);
      getFavorites();
      emit(ChangeFavSuccess());
    } else {
      favorites.containsValue(productId)
          ? favorites.remove(productId)
          : favorites.addAll({productId: productId});

      emit(ChangeFavSuccessError());
    }
  }

  Future download2(String url, String savePath, {context, id}) async {
    loadDownloadFileDialogShowing = true;
    postDownloadId = id;
    emit(DownloadFileLoad());
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,

        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );

      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);

      await raf.close();
      loadDownloadFileDialogShowing = false;
      precentDouble = 0;
      postDownloadId = -1;
      emit(DownloadFileSuccess());
    } catch (e) {
      print(e);
      loadDownloadFileDialogShowing = false;
      precentDouble = 0;
      postDownloadId = -1;
      emit(DownloadFileError());
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      // recent = ((received / total * 100).toStringAsFixed(0) + "%");
      precentDouble = double.parse((received / total * 100).toStringAsFixed(0));
      print(precentDouble.toString());
      emit(DownloadFileLoadProgress());
    }
  }

  void getPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,

      Permission.accessMediaLocation
      //add more permission to request here.
    ].request();
    emit(DownloadFileError());
  }

  Future<bool> hasAcceptedPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.status.isGranted &&
              // access media location needed for android 10/Q
              await Permission.accessMediaLocation.status.isGranted
          // manage external storage needed for android 11/R
          ) {
        return true;
      } else {
        return false;
      }
    }
    if (Platform.isIOS) {
      if (await Permission.photos.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      // not android or ios
      return false;
    }
  }
}
