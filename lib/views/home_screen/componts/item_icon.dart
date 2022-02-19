
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconItem extends StatelessWidget {
  final String icon;
  final void Function() onPress;
  const IconItem({
    required this.icon,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SvgPicture.asset(
    icon,
    height: 15,
    width: 15,
      ),
    );
  }
}
