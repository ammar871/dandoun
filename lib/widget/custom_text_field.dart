
import 'package:dandoun/helpers/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {
  final String hint;
  final void Function(String) onSave;
  final IconData iconData;
  final bool isPassword;
  String errorValidate;
  final TextInputType keabord;

  CustomTextFormField(
      {Key? key, required this.iconData,
      required this.hint,
      required this.onSave,
      required this.keabord,
      this.isPassword = false,
      this.errorValidate = ""}) : super(key: key);

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
          obscureText: isVisibaly,
          textAlign: TextAlign.start,
          onSaved: (newValue) => widget.onSave(newValue!),
          keyboardType: widget.keabord ,
          validator: (String? value) {
            if (value!.isEmpty) {


              setState(() {
                isValidate = true;
              });

              return widget.errorValidate;
            }
            setState(() {
              isValidate = false;
            });

            return null;
          },
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
