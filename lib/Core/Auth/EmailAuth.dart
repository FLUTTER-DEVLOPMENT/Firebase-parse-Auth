import 'package:firebase_auth/firebase_auth.dart';
import 'package:log_application/Core/Modal/AuthResponse.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'ParseAuth.dart';

class EmailAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  ParseAuth parseAuth = ParseAuth();
  Future<AuthResponse> createUserWithEmail(
      {String email, String password, String username}) async {
    AuthResponse authRes = AuthResponse();
    try {
      ParseResponse res = await parseAuth.signUpWithEmail(
          userName: username, email: email, password: password);
      if (res.success) {
        print("Success");
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        authRes.setAuth(auth);
      } else {
        // print("Error");

        if ("DioError [DioErrorType.RESPONSE]: Http status error [400]" ==
            res.error.message.toString()) {
          authRes.setError("Something Went Wrong");
        } else {
          authRes.setError(res.error.message.toString());
        }
      }
    } catch (e) {
      print(e);
      authRes.setError(e);
    }
    return authRes;
  }

  Future<AuthResponse> logInUserWithEmail(
      {String email, String password}) async {
    AuthResponse authRes = AuthResponse();
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      authRes.setAuth(auth);
    } catch (e) {
      print(e.message);
      authRes.setError(e.message);
    }
    return authRes;
  }

  Future<AuthResponse> forgotPassword({String email}) async {
    AuthResponse authRes = AuthResponse();
    try {
      await auth.sendPasswordResetEmail(email: email);
      authRes.setAuth(auth);
    } catch (e) {
      print(e.message.toString());
      authRes.setError(e.message);
    }
    return authRes;
  }

  void logOut() async {
    await auth.signOut();
  }
}
