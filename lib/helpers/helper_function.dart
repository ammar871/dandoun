


// import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';




import 'functions.dart';

class HelperFunction{


  static HelperFunction slt = HelperFunction();

  // notifyUser({context, message, color, bool isNeedPop = false}) {
  //
  //
  //   return  Flushbar(
  //     padding: const EdgeInsets.all(30),
  //     flushbarStyle: FlushbarStyle.GROUNDED,
  //     flushbarPosition: FlushbarPosition.TOP,
  //     message: message,
  //     duration: const Duration(seconds: 3),
  //     backgroundColor: color,
  //     animationDuration: const Duration(milliseconds: 400),
  //     leftBarIndicatorColor: color,
  //   )..show(context).whenComplete(() {
  //     if (isNeedPop) pop(context);
  //   });
  // }

  showSnakeBar({context,message,color,key}){

     final snackBar = SnackBar(

       backgroundColor: color,
      content:  Text(message,style: const TextStyle(
        fontFamily: "pnuB"

      ),),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }



  showSheet(BuildContext context,child) {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return child;
      },
    );
  }


  // openGoogleMapLocation(lat, lng) async {
  //   String mapOptions = [
  //     'saddr=${locData.latitude},${locData.longitude}',
  //     'daddr=$lat,$lng',
  //     'dir_action=navigate'
  //   ].join('&');
  //
  //   final url = 'https://www.google.com/maps?$mapOptions';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}