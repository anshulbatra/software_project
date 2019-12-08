import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  Stream<String> get onAuthStateChanged=> _firebaseAuth.onAuthStateChanged.map(
    (FirebaseUser user) => user?.uid,
  );

  //sign up 
  Future<String> createUserWithEmailAndPassword(String _email,String _password,String _name,String _aadhar,String _dob,String _contact) async
  {
    final currentUser= await _firebaseAuth.createUserWithEmailAndPassword(
      email: _email,password: _password
    );

  //update name
    var userUpdateInfo= UserUpdateInfo();
    userUpdateInfo.displayName = _name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;
  } 

//sign in
Future<String> signInWithEmailAndPassword(String _email,String _password) async
{
  return (await _firebaseAuth.signInWithEmailAndPassword(
            email: _email, password: _password)).uid;
}
//signout
 signOut() {
    return _firebaseAuth.signOut();
  }

}