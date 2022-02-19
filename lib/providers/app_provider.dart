import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class AppProvider extends ChangeNotifier{

  static AppProvider getInItWatch(BuildContext context) {
    return context.watch<AppProvider>();
  }

  static AppProvider getInItRead(BuildContext context) {
    return context.read<AppProvider>();
  }


  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    notifyListeners();
  }
}