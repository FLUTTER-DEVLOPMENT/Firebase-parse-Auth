import 'package:flutter/material.dart';
import 'package:log_application/ui/screens/ForgotPassword.dart';
import 'package:log_application/ui/screens/LogInScreen.dart';
import 'package:log_application/ui/screens/SignUpScreen.dart';

class LogInRoutes extends Route {
  static Route<dynamic> generatesRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "logInScreen":
        return MaterialPageRoute(builder: (_) => LogInScreen());
        break;
      case 'signUpScreen':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        break;
      case 'forgotPasswordScreen':
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => LogInScreen());
    }
  }
}
