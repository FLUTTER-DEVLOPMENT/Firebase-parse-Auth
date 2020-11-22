import 'package:flutter/material.dart';
import 'package:log_application/ui/screens/HomeScreen.dart';

class HomeRoutes extends Route {
  static Route<dynamic> generatesRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
