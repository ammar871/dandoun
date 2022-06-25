
import 'package:dandoun/helpers/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;
  double radius;

  bool isIcon;

  CustomFormField(
      {
        required this.headingText,
        required this.hintText,
        required this.obsecureText,
        required this.suffixIcon,
        required this.textInputType,
        required this.textInputAction,
        required this.controller,
        required this.maxLines,this.isIcon=false,
        this.radius=10
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.headline5!.color!,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          maxLines: maxLines,
          style: const TextStyle(
            fontFamily: 'pnuR',
            fontSize: 15,
            color: textColor,
            fontWeight: FontWeight.w700,

          ),
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: textInputType,

          obscureText: obsecureText,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon:isIcon?const Icon(Icons.search):null ,
              hintStyle: KTextStyle.textFieldHintStyle,
              border: InputBorder.none,
              suffixIcon: suffixIcon),
        ),
      ),
    );
  }
}

class KTextStyle {
  static const headerTextStyle = TextStyle(
      color: Color(0xffC8C8C8), fontSize: 28, fontWeight: FontWeight.w700);

  static const textFieldHeading =
  TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

  static const textFieldHintStyle = TextStyle(
      color: Color(0xffC8C8C8),
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "pnuB");
//
// static const authButtonTextStyle = TextStyle(
//     fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.whiteshade);
}

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  String Function(String?)? validate;
  bool isValidate;
  final IconData iconData;
  final bool isPassword;
  // String errorValidate;
  final TextInputType keabord;

  CustomTextFormField(
      { required this.iconData,
      required this.hint,
        required this.controller,
        this.isValidate=false,
        this.validate,
      // required this.onSave,
      required this.keabord,
      this.isPassword = false});
      // this.errorValidate = ""}) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisibaly = false;
  bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isValidate ? 80 : 54,
      decoration: BoxDecoration(
          color: Theme.of(context).textTheme.headline5!.color!,
          borderRadius: BorderRadius.circular(5),
        border: Border.all(color: homeColor,width: 1)
          ), child: Center(
        child: TextFormField(
          controller: widget.controller,
          obscureText: isVisibaly,
          textAlign: TextAlign.start,
          // onSaved: (newValue) => widget.onSave(newValue!),
          keyboardType: widget.keabord ,
          validator:isValidate? widget.validate!:null,



          style: const TextStyle(
            fontFamily: 'pnuR',
            fontSize: 15,
            color: textColor,
            fontWeight: FontWeight.w700,
            
          ),
          
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isVisibaly = !isVisibaly;
                      });
                    },
                    child: Icon(isVisibaly
                        ? Icons.visibility_off_rounded
                        : Icons.remove_red_eye))
                : null,
            prefixIcon: Icon(widget.iconData,color: textColor,),
            focusedErrorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            hintText: widget.hint,
            hintStyle: const TextStyle(color: textColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    );
  }
}
