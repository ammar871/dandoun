import 'package:cached_network_image/cached_network_image.dart';
import 'package:dandoun/helpers/functions.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';
import '../../../models/home_model.dart';

class AppBarDetialsWidget extends StatelessWidget {
  final Post post;


  AppBarDetialsWidget(this.post);

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
              leading: CachedNetworkImage(
                imageUrl:
                baseurlImage + post.photo!,
                width: 29,
                height: 29,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Container(
                      width: 25,
                      height: 25,
                      child:
                      const CircularProgressIndicator(
                        color: Colors.green,
                      )),
                ),
                errorWidget: (context, url, error) =>
                    const SizedBox(
                        width: 29,
                        height: 29,
                        child: Center(
                            child: Icon(
                              Icons.error,
                              size: 25,
                            ))),
              ),
              title:  Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: CustomText(
                    family: "pnuB",
                    size: 10,
                    text: post.publisherName!,
                    textColor: Colors.white,
                    weight: FontWeight.bold,
                    align: TextAlign.start),
              ),
              subtitle:  CustomText(
                  family: "pnuL",
                  size: 10,
                  text:post.publisherSummary!,
                  textColor: textColor,
                  weight: FontWeight.w400,
                  align: TextAlign.start),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: (){
              pop(context);
            },
            child: Padding(
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
          ),
        ],
      ),
    );
  }
}