import "package:flutter/material.dart";
import 'package:log_application/ui/components/DividerWithLabel.dart';
import 'package:log_application/ui/components/IconButtonWithLabel.dart';
import 'package:log_application/ui/components/RoundedInputField.dart';
import 'package:log_application/ui/viewModels/LogInModal.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String email;
  String password;
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
              "Log In",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
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
            GestureDetector(
              onTap: () {
                Provider.of<LogInModal>(context, listen: false).clearError();
                Navigator.pushNamed(context, 'forgotPasswordScreen');
              },
              child: Text(
                "Forgot Password",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Provider.of<LogInModal>(context).logInError != null
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      Provider.of<LogInModal>(context).logInError.toString(),
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
                  Provider.of<LogInModal>(context, listen: false)
                      .logIn(email, password);
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            DividedWithLabel(
              label: "OR",
            ),
            IconButtonWithLabel(
              color: Colors.cyanAccent,
              icon: Image.asset(
                "images/googleIcon.png",
                width: 30,
              ),
              onPress: () {
                Provider.of<LogInModal>(context, listen: false)
                    .logInWithGoolge();
              },
              label: Text(
                "Log in With Google",
                style: TextStyle(fontSize: 18),
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
            //     "Log in With Facebook",
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
                  Provider.of<LogInModal>(context, listen: false).clearError();
                  Navigator.pushNamed(context, "signUpScreen");
                },
                child: Text(
                  "Don't Have An Account? Sign Up",
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
