import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'componts/container_bunner.dart';
import 'componts/item_list.dart';
import 'componts/titles_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: homeColor,
        centerTitle: true,
        title: SvgPicture.asset(
          "assets/icons/logo.svg",
          height: 25,
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Image.asset(
              "assets/images/person.png",
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                height: 2,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            SizedBox(
              height: 345,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return ItemList();
                  },
                  itemCount: 10),
            ),
            const SizedBox(
              height: 38,
            ),
           const Padding(
             padding: EdgeInsets.symmetric(horizontal: 7.0),
             child: ContainerBanner(image:  "assets/images/back.png",),
           ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TitlesText(
                onPress: () {

                },
                title: "الأكثر سماعا",
                textButton: "الكل",

              ),
            ),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 345,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return ItemList();
                  },
                  itemCount: 10),
            ),



            const SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TitlesText(
                onPress: () {

                },
                title: "من اجلك",
                textButton: "الكل",

              ),
            ),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 345,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return ItemList();
                  },
                  itemCount: 10),
            ),

            const SizedBox(
              height: 87,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              child: ContainerBanner(image:  "assets/images/back2.png",),
            ),

            const SizedBox(
              height: 50,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TitlesText(
                onPress: () {

                },
                title: "جديد",
                textButton: "الكل",

              ),
            ),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 345,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return ItemList();
                  },
                  itemCount: 10),
            ),
            const SizedBox(
              height: 85,
            ),
          ],
        ),
      ),
    );
  }
}




