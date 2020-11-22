import "package:flutter/material.dart";
import 'package:log_application/ui/components/RoundedInputField.dart';
import 'package:log_application/ui/viewModels/LogInModal.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(),
              flex: 2,
            ),
            Text(
              "Forgot Password",
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
            SizedBox(
              height: 5,
            ),
            Provider.of<LogInModal>(context).forgotPasswordError != null
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      Provider.of<LogInModal>(context)
                          .forgotPasswordError
                          .toString(),
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
                      .forgotPassword(email);
                },
                child: Text(
                  "Send Mail",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
