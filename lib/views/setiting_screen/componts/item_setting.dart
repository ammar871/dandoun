import 'package:flutter/material.dart';
import '../../../widget/custom_text.dart';

class ItemSetting extends StatelessWidget {
  final void Function() onPress;
  final String title;
  final IconData icon;
  bool isLogout;

   ItemSetting(
      {
      required this.onPress,
        this.isLogout=false,
      required this.title,
      required this.icon})
     ;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPress,
      child: Container(
        height: 60,
        decoration:  BoxDecoration(
            border: isLogout?null: const Border(bottom: BorderSide(color: Colors.grey, width: 1))),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color:isLogout?Colors.red: Theme.of(context).textTheme.bodyText1!.color!,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomText(
                weight: FontWeight.w500,
                text: title,
                family: "pnuB",
                size: 14,
                textColor:isLogout?Colors.red: Theme.of(context).textTheme.bodyText1!.color!,
                align: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
