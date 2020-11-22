import 'package:flutter/foundation.dart';
import 'package:log_application/Core/Auth/EmailAuth.dart';
import 'package:log_application/Core/Auth/GoogleAuth.dart';
import 'package:log_application/Core/Modal/AuthResponse.dart';

class LogInModal extends ChangeNotifier {
  EmailAuth emailAuth = EmailAuth();
  GoogleAuth googleAuth = GoogleAuth();
  String logInError;
  String signUpError;
  String forgotPasswordError;
  void logIn(String email, String password) async {
    AuthResponse authRes =
        await emailAuth.logInUserWithEmail(email: email, password: password);
    if (authRes.error != null) {
      logInError = authRes.error;
      notifyListeners();
    } else {
      logInError = null;
      notifyListeners();
    }
  }

  void signUp({String email, String password, String userName}) async {
    AuthResponse authRes = await emailAuth.createUserWithEmail(
        email: email, password: password, username: userName);
    if (authRes.error != null) {
      signUpError = authRes.error;
      notifyListeners();
    } else {
      signUpError = null;
      notifyListeners();
    }
  }

  void forgotPassword(String email) async {
    AuthResponse authRes = await emailAuth.forgotPassword(email: email);
    if (authRes.error != null) {
      forgotPasswordError = authRes.error;
      notifyListeners();
    } else {
      forgotPasswordError = null;
      notifyListeners();
    }
    print(forgotPasswordError.toString());
  }

  void logInWithGoolge() async {
    AuthResponse authRes = await googleAuth.signIn();
  }

  void clearError() {
    logInError = null;
    signUpError = null;
    forgotPasswordError = null;
    notifyListeners();
  }

  void signOut() {
    googleAuth.signOut();
  }
}
