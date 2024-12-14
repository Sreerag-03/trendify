
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in with Email and Password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          return result.user;
    } catch (e) {
      print("Error:$e");
      return null;
    }
  }


  //Register with Email and Password
  Future<User?> registerWithEmailAndPassword(String email,String password)async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print("Error $e");
      return null;
    }
  }


  //Sign Out
  Future<void> signOut()async{
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error $e");
    }
  }

  //Get the current user
  User? get currentUser => _auth.currentUser;
}
