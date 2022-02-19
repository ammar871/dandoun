import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitlesText extends StatelessWidget {
  final String title, textButton;

  final void Function() onPress;
  final Color textColor;

  const TitlesText(
      {Key? key, required this.onPress,
        required this.title,
        required this.textButton,

        this.textColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          weight: FontWeight.w500,
          text: title,
          family: "pnuR",
          size: 30,
          textColor: Colors.white, align: TextAlign.start,),
        InkWell(
          onTap: onPress,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  weight: FontWeight.w500,
                  text: textButton,
                  family: "pnuL",
                  size: 18,
                  textColor: Colors.white, align: TextAlign.end,),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
        )

      ],
    );
  }
}