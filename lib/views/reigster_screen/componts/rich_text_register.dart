import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RichTextRegister extends StatelessWidget {
  const RichTextRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *.8,
      child:  Text.rich(
        TextSpan(

          style: TextStyle(
            fontFamily: 'pnuM',
            fontSize: 12,
            color: Theme.of(context).textTheme.bodyText1!.color!,
            height: 2,
          ),
          children: const [
            TextSpan(
              text:
              'اهلا وسهلا بك في منصتنا ... نسعد بوجودك معنا برجاء إتمام تعبئة البيانات التالية لتحصل علي حساب جديد لك معن. . اذا كان لديك',
            ),
            TextSpan(
              text: ' حساب ادخل من هنا',
              style: TextStyle(
                color: Color(0xff23ad8b),
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.right,
      ),
    );
  }
}