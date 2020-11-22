import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:log_application/ui/Routes/Router.dart';
import 'package:log_application/ui/screens/HomeScreen.dart';
import 'package:log_application/ui/screens/LogInScreen.dart';
import 'package:log_application/ui/viewModels/LogInModal.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

const String PARSE_APP_ID = 'lz79i2uQUfoUAz5xrbmgpEaoClDCxkwXwRnu7kr3';
const String PARSE_APP_URL = 'https://parseapi.back4app.com';
const String MASTER_KEY = 'JdbZLDuhVb37ivQdf5YXI1ZOFO7Ey2oPnyZduGzh';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Parse().initialize(
    PARSE_APP_ID,
    PARSE_APP_URL,
    masterKey: MASTER_KEY,
    autoSendSessionId: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      StreamProvider<User>.value(
          value: FirebaseAuth.instance.authStateChanges()),
      ChangeNotifierProvider<LogInModal>.value(value: LogInModal())
    ], child: SwitchScreen());
  }
}

class SwitchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      return HomeApp();
    } else {
      return LogInApp();
    }
  }
}

class LogInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log In Demo App',
      home: LogInScreen(),
      onGenerateRoute: LogInRoutes.generatesRoutes,
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log In Demo App',
      home: HomeScreen(),
    );
  }
}
