import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerBanner extends StatelessWidget {
  final String image;

  const ContainerBanner({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(


      height: 120,

      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          image:  DecorationImage(
            image: AssetImage(
               image),
            fit: BoxFit.fill,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: const [
            CustomText(
                family: "pnuB",
                size: 15,
                text: "المعرفة هي غذاء الروح..",
                textColor: Colors.white,
                weight: FontWeight.bold,
                align: TextAlign.start),
            CustomText(
                family: "pnuB",
                size: 15,
                text: " أفلاطون",
                textColor: Colors.white,
                weight: FontWeight.bold,
                align: TextAlign.start),
          ],
        ),
      ),
    );
  }
}