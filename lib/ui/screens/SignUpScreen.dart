import "package:flutter/material.dart";
import 'package:log_application/ui/components/DividerWithLabel.dart';
import 'package:log_application/ui/components/RoundedInputField.dart';
import 'package:log_application/ui/viewModels/LogInModal.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email;
  String password;
  String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 20, right: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(),
              flex: 1,
            ),
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            RoundedInputField(
              onChange: (n) {
                username = n;
              },
              label: "Enter User Name",
            ),
            RoundedInputField(
              onChange: (n) {
                email = n;
              },
              label: "Enter Email",
            ),
            RoundedInputField(
              onChange: (n) {
                password = n;
              },
              isPassword: true,
              label: "Enter Password",
            ),
            SizedBox(
              height: 5,
            ),
            Provider.of<LogInModal>(context).signUpError != null
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      Provider.of<LogInModal>(context).signUpError.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Text(''),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                splashColor: Colors.pink,
                color: Colors.amber,
                onPressed: () {
                  Provider.of<LogInModal>(context, listen: false).signUp(
                      userName: username, email: email, password: password);
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: 20,
            // ),
            // IconButtonWithLabel(
            //   color: Colors.blue,
            //   icon: FaIcon(
            //     FontAwesomeIcons.facebook,
            //     size: 30,
            //     color: Colors.white,
            //   ),
            //   onPress: () {},
            //   label: Text(
            //     "Sign Up With Facebook",
            //     style: TextStyle(fontSize: 18, color: Colors.white),
            //   ),
            // ),
            Expanded(
              child: Container(),
              flex: 3,
            ),
            DividedWithLabel(
              label: "Create Account",
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Have An Account? Log In",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
