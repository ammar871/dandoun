import 'package:dandoun/bloc/app_cubit/app_cubit.dart';
import 'package:dandoun/bloc/package_cubit/package_cubit.dart';
import 'package:dandoun/models/package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/styles.dart';
import '../../widget/custom_text.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PackageCubit, PackageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(

          appBar: AppBar(
centerTitle: true,
            title: CustomText(
              weight: FontWeight.w500,
              text: "الباقات",
              family: "pnuB",
              size: 16,
              textColor: Theme.of(context).textTheme.bodyText1!.color!,
              align: TextAlign.start,
            ),
            automaticallyImplyLeading: false,
          ),
          body: PackageCubit.get(context).loadPackages
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
              : GridView.builder(
            physics: const BouncingScrollPhysics(),
padding: EdgeInsets.symmetric(horizontal: 10),
            gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 0.9,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
              itemBuilder: (ctx, index) {
              Package package=  PackageCubit.get(context).packages[index];

                return GestureDetector(

                  onTap: (){
                    AppCubit.get(context).changeAppMode();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(.1),
                    ),
                    margin: EdgeInsets.all(5),
                    height: 200,

child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    CustomText(
      weight: FontWeight.bold,
      text: package.name!,
      family: "pnuB",
      size: 22,
      textColor: Theme.of(context).textTheme.bodyText1!.color!,
      align: TextAlign.start,
    ),
    SizedBox(height: 15,),
    CustomText(
      weight: FontWeight.bold,
      text:package.months!.toString()+ " / شهر ",
      family: "pnuB",
      size: 17,
      textColor: secondColor,
      align: TextAlign.start,
    ),
    SizedBox(height: 15,),
    CustomText(
      weight: FontWeight.bold,
      text:package.price!.toString()+ " / ريال  ",
      family: "pnuB",
      size: 17,
      textColor: secondColor,
      align: TextAlign.start,
    ),

  ],
),

                  ),
                );
              },
              itemCount: PackageCubit.get(context).packages.length,

            ),
        );
      },
    );
  }
}