import 'package:flutter/material.dart';

class DividedWithLabel extends StatelessWidget {
  final String label;
  DividedWithLabel({this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              height: 0.5,
            ),
          ),
          Text(this.label),
          Expanded(
            child: Container(
              color: Colors.black,
              height: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
