import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/main/home/services/responses/products_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  Future<ProductResponse> getHomeProducts() async {
    List<ProductResponseData> _productResponse = [];
    var response = await _firebaseFirestore.collection('products').get();
    response.docs.asMap().forEach((key, value) {
      _productResponse.add(ProductResponseData.fromJson(value.data()));
      //debugPrint(value.data()['image_url']);
    });
    return ProductResponse(_productResponse);
    //debugPrint(response.docs[0]["product_id"]);
  }
}
