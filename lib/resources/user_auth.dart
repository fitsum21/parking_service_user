import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  Future<bool> isEmailVerifed() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signIn(String _email, String _password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: _email, password: _password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<FirebaseUser> getUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<bool> signWithPhone(
    String phone,
    PhoneCodeSent codeSent,
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    PhoneVerificationFailed verificationFailed,
   
  ) async {
    
    print('phone $phone');
    
  
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          AuthResult result = await _firebaseAuth.signInWithCredential(credential);
          FirebaseUser user = result.user;

          return true;
        },
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
        
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
