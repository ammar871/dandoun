import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dandoun/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import '../../helpers/constants.dart';
import '../../helpers/functions.dart';
import '../../helpers/helper_function.dart';
import '../../models/user_model.dart';
import '../../views/navigation_screen/navigation_screen.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  String countryCode="971+";

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  bool isCheckedUserName = false;

  checkUserName({phone}) async {
    isCheckedUserName = true;
    emit(CheckUserAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + checkUserNamePoint));
    request.fields.addAll({'phone': phone});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonData);
      isCheckedUserName = false;
      emit(CheckUserAuthStateSuccess(
          phone: phone, code: jsonData["code"], status: jsonData["status"]));
    } else {
      isCheckedUserName = false;
      printFunction("errrrrrrrrrror"+response.statusCode.toString());
      emit(CheckUserAuthStateError());
    }
  }

  bool isValidate = false;

  validateUser({username, email, fullName}) async {
    emit(ValidateAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + validatePoint));
    request.fields.addAll({'email': email, 'userName': username});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      // final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonsDataString);

      // registerUser(email: email, userName: username, fullName: fullName);
    } else if (response.statusCode == 400) {
      String jsonsDataString = await response.stream.bytesToString();
      // final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonsDataString);
      emit(ValidateAuthStateError(jsonsDataString));
    } else {
      printFunction(response.statusCode);
      emit(ValidateAuthStateError("errrrrrrrrrror"));
    }
  }

  bool isRegisterLoad = false;

  registerUser({fullName,phone, userName, role,pass,context}) async {
    isRegisterLoad = true;
    emit(RegisterAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + registerPoint));
    request.fields.addAll({
      'fullName': fullName,
      'Phone': phone,
      'userName': userName,
      'knownName': 'askdkalshkjsa',
      'Role': 'user',
      'password': pass,
      'DeviceFCM': "tokenFCM"
    });




    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonData);
      isRegisterLoad = false;
      pushPage(
          page:const LoginScreen(),
          context: context);

      emit(
          RegisterAuthStateSuccess(code: jsonData["code"], userName: userName));
    } else {
      printFunction(response.reasonPhrase);
      isRegisterLoad = false;
      emit(RegisterAuthStateError());
    }
  }

  UserModel user = UserModel();

  bool loadLogin=false;
  loginUser({code, userName,tokenFcm,context}) async {
    loadLogin=true;
    emit(LoginAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + loginPoint));
    request.fields.addAll({'Password': code, 'userName': userName, 'DeviceToken': 'askdkalshkjsa'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonData);

      UserResponse userResponse = UserResponse.fromJson(jsonData);
      if(userResponse.user!.role=="user"){

        token = "Bearer " + userResponse.token!;
        print(token+"");
        currentUser = user = userResponse.user!;



        await saveToken();
        printFunction("currentUser$token");

        printFunction(userResponse.token);
        UpdateDeviceToken(userId: userResponse.user!.id!).then((value){
          pushPage(
              page:const NavigationScreen(),
              context: context);
          loadLogin=false;
        });


        emit(LoginAuthStateSuccess(userResponse));
      }


    } else if (response.statusCode == 401) {
      loadLogin=false;
      HelperFunction.slt.showSnakeBar(
          context: context, color: Colors.red, message: "الحساب غير موجود");
      emit(LoginAuthStateError());
    }else{

      // HelperFunction.slt.notifyUser(
      //   message: "الحساب مسجل كمزود خدمة ",context: context,color: Colors.red
      // );
      loadLogin=false;
      emit(LoginAuthStateError());
    }
  }

  bool isChecked = false;

  changeCheckBox(bool checked) {
    isChecked = checked;
    printFunction(isChecked);
    emit(ChangeCheckBox());
  }

  int currentStatus = 0;

  currentStatusState(int newStatus) {
    currentStatus = newStatus;
    printFunction(currentStatus);
    emit(ChangeCheckBox());
  }

 Future UpdateDeviceToken({token, userId}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + '/auth/update-deviceToken'));
    request.fields.addAll({'UserId': userId, 'Token': tokenFCM});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("updatedToken");
    } else {
      print("ErrorUpdatedToken");
    }
  }

  bool isValidatePass=true;
  validatePassword(String validate){

    if(validateStructure(validate)){

      isValidatePass=true;
      emit(ChangeValidate());

    }else{
      isValidatePass=false;
      emit(ChangeValidate());
    }


  }



  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool loadLoginGoogle=false;
  Future loginWithGoogle({context}) async {
    loadLoginGoogle=true;
    emit(LoginSocialAuthStateLoad());
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential).then((value){

       callLoginWithSocial(
         context: context,
         fullName: value.user!.displayName,
         userName: value.user!.email,newToken: value.user!.uid,
         status: 0,
         password: "Abc1234@"
       );
      });


      emit(LoginSocialAuthStateSuccess());

    } catch (e) {

      loadLoginGoogle=false;
      emit(LoginSocialAuthStateError());
    }
  }

  bool loadFaceLogin=false;
  loginWithFacebook({context}) async {
    print("strt");
    loadFaceLogin=true;
    emit(LoginFaceAuthStateLoad());
    try {
      // Trigger the authentication flow
      final LoginResult loginResult=    await FacebookAuth.instance.login(permissions:["email","public_profile"]);

      if(loginResult.status == LoginStatus.success){
        print("vccccccccc${loginResult.accessToken!.token}");
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
        FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value){

          callLoginWithSocial(
              context: context,
              fullName: value.user!.displayName,
              userName: value.user!.email,newToken: value.user!.uid,
              status:1,
              password: "Abc1234@"
          );


        });

        emit(LoginFaceAuthStateSuccess());
      }else{

        print("object");
        loadFaceLogin=false;

        emit(LoginFaceAuthStateError());
      }




    } catch (e) {
      loadFaceLogin=false;
      print("error"+e.toString());
      emit(LoginFaceAuthStateError());
    }
  }


  callLoginWithSocial({fullName,userName,password,newToken,status,context})async{

    var request = http.MultipartRequest('POST', Uri.parse(baseUrl+'/auth/google/login'));
    request.fields.addAll({
      'FullName': fullName,
      'userName': userName,
      'Password': password,
      'DeviceToken': newToken,
      'Role': 'user'
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonData);

      UserResponse userResponse = UserResponse.fromJson(jsonData);


        token = "Bearer " + userResponse.token!;
        print(token+"");
        currentUser = user = userResponse.user!;



        await saveToken();
        printFunction("currentUsergoogle$token");

        printFunction(userResponse.token);
        if(status==0) {
          loadLoginGoogle=false;
        } else {
          loadFaceLogin=false;
        }

        pushPage(context: context,page: const NavigationScreen());
      emit(LoginSocialAuthStateSuccess());
    }
    else {
      if(status==0) {
        loadLoginGoogle=false;
      } else {
        loadFaceLogin=false;
      }
      print(response.statusCode.toString());
      emit(LoginSocialAuthStateError());
    }

  }

  Future<void> logOut({context,onSuccess,onError}) async {
    await FirebaseAuth.instance.signOut().then((value){
    }).onError((error, stackTrace){
    });
  }






}
