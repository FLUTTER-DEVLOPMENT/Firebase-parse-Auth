import 'package:parse_server_sdk/parse_server_sdk.dart';

class ParseAuth {
  Future<ParseResponse> signUpWithEmail(
      {String userName, String password, String email}) async {
    ParseUser user = ParseUser(userName, password, email);
    user.sessionToken;
    //You can add Collumns to user object adding "..set(key,value)"
    return await user.save();
  }

  Future<ParseResponse> logInWithEmail(
      {String userName, String password, String email}) async {
    ParseUser user = ParseUser(userName, password, email);

    return await user.login();
  }

  Future<ParseResponse> logOut() async {
    ParseUser user = await ParseUser.currentUser();
    return await user.logout();
  }

  Future<ParseResponse> resetPassword({String email}) async {
    return await ParseUser("", "", email.toString()).requestPasswordReset();
  }
}
