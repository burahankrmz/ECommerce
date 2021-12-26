import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  FirebaseServices(this._firebaseAuth, this._firebaseFirestore);

  Future<UserCredential> signUp(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> logIn(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<void> forgotPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future getHomeProducts() async {
    await _firebaseFirestore.collection('products').get();
  }
}
