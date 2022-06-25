import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dandoun/helpers/constants.dart';
import 'package:dandoun/models/package.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(PackageInitial());

  static PackageCubit get(context) => BlocProvider.of<PackageCubit>(context);

  bool loadPackages = false;
  List<Package> packages = [];

  getPackages() async {
    loadPackages = true;
    packages = [];
    emit(GetPackagesLoad());
    var request = http.MultipartRequest(
        'GET', Uri.parse(baseUrl + '/package/get-packages'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {


      print(response.statusCode.toString());
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);

      jsonData.forEach((v) {
        packages.add(Package.fromJson(v));
      });
      loadPackages = false;

      emit(GetPackagesSuccess());
    } else {
      print(response.statusCode.toString());
      loadPackages = false;
      emit(GetPackagesError());
    }
  }
}
