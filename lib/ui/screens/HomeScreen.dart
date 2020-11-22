import 'package:flutter/material.dart';
import 'package:log_application/ui/viewModels/LogInModal.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Sign Out"),
          onPressed: () {
            Provider.of<LogInModal>(context, listen: false).signOut();
          },
        ),
      ),
    );
  }
}
