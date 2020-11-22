import 'package:flutter/material.dart';

class RoundedInputField extends StatefulWidget {
  final bool isPassword;
  final String label;
  final Function onChange;

  RoundedInputField({this.isPassword = false, this.label = '', this.onChange});
  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  bool isHide = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        autofocus: false,
        onChanged: (newValue) {
          widget.onChange(newValue);
        },
        obscureText: isHide,
        cursorHeight: 25,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: () {
                    setState(() {
                      isHide = !isHide;
                    });
                  },
                )
              : Text(''),
          fillColor: Colors.grey[300],
          filled: true,
          hintText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
