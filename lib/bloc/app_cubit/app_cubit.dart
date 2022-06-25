import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../helpers/constants.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  int currentIndex = 0;


  changeNav(int index) {
    currentIndex = index;

    emit(ChangeNav());
  }


  bool isChecked = false;

  changeCheckBox(bool checked) {
    isChecked = checked;
    print(isChecked);
    emit(ChangeCheckBox());
  }




  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(ChangeMode());
  }

}

