import 'package:dandoun/helpers/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SwitchWidget extends StatefulWidget {
  final void Function(bool) onSelect;

  SwitchWidget(this.onSelect);

  @override
  _SwitchWidgetState createState() =>  _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.2,
        child: Switch(
          autofocus: false,
          onChanged: (value) {

            setState(() {
              isSwitched = value;
             widget.onSelect(value);
            });

          },
          value: isSwitched,
          activeColor: Colors.white,
          activeTrackColor: homeColor,
          inactiveThumbColor: Colors.black,
          inactiveTrackColor: homeColor,
        ));
  }
}
