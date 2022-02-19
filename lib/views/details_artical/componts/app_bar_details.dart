import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarDetialsWidget extends StatelessWidget {
  const AppBarDetialsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 200,
            child: ListTile(
              horizontalTitleGap: 5,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              minVerticalPadding: 10.0,
              contentPadding:
              const EdgeInsets.only(left: 10.0, right: 10.0, top: 0),
              leading: Image.asset(
                "assets/images/img2.png",
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: CustomText(
                    family: "pnuB",
                    size: 10,
                    text: "وول ستريت جورنال",
                    textColor: Colors.white,
                    weight: FontWeight.bold,
                    align: TextAlign.start),
              ),
              subtitle: const CustomText(
                  family: "pnuL",
                  size: 10,
                  text: "ساره نيدل مان",
                  textColor: textColor,
                  weight: FontWeight.w400,
                  align: TextAlign.start),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 13, left: 10, right: 10),
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                CustomText(
                    family: "pnuR",
                    size: 14,
                    text: "عودة",
                    textColor: Colors.white,
                    weight: FontWeight.bold,
                    align: TextAlign.start),
                SizedBox(
                  width: 29,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 24,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}