import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;

  User? get currentUser => _firebaseauth.currentUser;

  Future<User?> get authStateChange => _firebaseauth.authStateChanges().first;

  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      print("Error");
      throw Exception(err);
    }
  }

  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    await _firebaseauth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
