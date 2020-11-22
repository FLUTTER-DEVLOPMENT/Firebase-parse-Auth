import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:log_application/Core/Modal/AuthResponse.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GoogleAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<AuthResponse> signIn() async {
    AuthResponse authRes = AuthResponse();
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      await _auth.signInWithCredential(credential);

      ParseUser user = ParseUser.createUser(
          _auth.currentUser.displayName, "MyPassword", _auth.currentUser.email);
      ParseResponse res = await user.save();
      if (res.success) {
        print("Success");
      } else {
        print(res.error.message);
      }

      authRes.setAuth(_auth);
    } catch (e) {
      print(e.message);
      authRes.setError(e.message);
    }
    return authRes;
  }

  void signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }
}
