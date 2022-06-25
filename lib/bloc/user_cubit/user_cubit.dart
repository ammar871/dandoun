import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../helpers/constants.dart';
import '../../helpers/functions.dart';
import '../../models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);









  UserDetailsResponse userModel = UserDetailsResponse();
  bool loadUserDetails = false;

  Future getUserDetails() async {
    loadUserDetails = true;
    emit(GetUserDetails());
    var headers = {'Authorization': token};
    var request =
    http.Request('POST', Uri.parse(baseUrl + getUserDetailsPoint));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);

      userModel = UserDetailsResponse.fromJson(jsonData);

      currentUser = userModel.user!;
      await saveToken();
      print("userModel.id${userModel.user!.fullName}");
      loadUserDetails = false;
      print(response.statusCode.toString());
      emit(GetUserDetails());

      print(jsonData);
    } else {
      print(response.statusCode.toString());
      emit(GetUserDetails());
    }
  }
  bool loadImage = false;
  Future<dynamic> uploadImage(file) async {
    loadImage = true;
    emit(UploadImageLoad());
    const url = baseUrl + uploadImagePoint;
    var request = http.MultipartRequest("POST", Uri.parse(url));

    var multipartFile = await http.MultipartFile.fromPath(
      "file",
      file.path,
    );
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    var postBody = await http.Response.fromStream(response);

    if (response.statusCode == 200) {

      emit(UploadImageSuccess(postBody.body.toString()));


      //update profile



    } else {
      return "a.jpg";
    }
  }

  Future getImage(context, imageProvider) async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      source: imageProvider,
      imageQuality: 5,
    );
    if (pickedFile != null) {
      File? imagePath = File(pickedFile.path);
      emit(PickedImage(imagePath));
      imagePath = null;
    } else {
      print('No image selected.');
    }
  }

  bool loadUpdate =false;

  Future updateProfile({name,phone,image}) async {
    loadUpdate=true;
    emit(UpdateProfileLoad());
    var headers = {
      'Authorization': token
    };
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl+updateUserDetailsPoint));
    request.fields.addAll({
      'FullName': name,
      'Phone': phone,
      'ImageUrl': image,
      'PackageId': currentUser.packageId.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);


      print(jsonData["imageUrl"]+"updated");
      loadUpdate=false;
      getUserDetails();
      emit(UpdateProfileSuccess("تم التعديل بنجاح"));
    }
    else {
      loadUpdate=false;
      print(response.reasonPhrase);
      emit(UpdateProfileError("فشلت العملية"));
    }

  }
}
