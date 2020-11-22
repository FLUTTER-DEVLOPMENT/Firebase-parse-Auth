import 'package:flutter/material.dart';

class IconButtonWithLabel extends StatelessWidget {
  final Function onPress;
  final Color color;
  final Text label;
  final Widget icon;
  IconButtonWithLabel(
      {@required this.onPress,
      this.color = Colors.blueAccent,
      this.label,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        splashColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [icon, label, Text("")],
        ),
        color: color,
        onPressed: onPress,
        height: 50,
      ),
    );
  }
}
