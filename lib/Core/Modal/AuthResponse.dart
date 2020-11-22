import 'package:firebase_auth/firebase_auth.dart';

class AuthResponse {
  String _error;
  FirebaseAuth _auth;
  get auth => this._auth;
  get error => this._error;
  void setAuth(FirebaseAuth a) => this._auth = a;
  void setError(String e) => this._error = e;
}
