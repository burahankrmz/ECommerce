import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  FirebaseServices(this._firebaseAuth, this._firebaseFirestore);

  Future<UserCredential> signUp(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    _firebaseFirestore
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({"id": userCredential.user!.uid, "email": email});
    return userCredential;
  }
}
