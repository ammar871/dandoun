import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconItem extends StatelessWidget {
  final String icon;
  bool isFav;
Widget? widget;
  final void Function() onPress;

   IconItem({
    required this.icon,
    required this.onPress,
    this.isFav = false,
    this.widget
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(2),
        child: isFav? widget :

        SvgPicture.asset(
          icon,
          height: 15,
          width: 15,
        ),
      ),
    );
  }
}
