import 'package:http/http.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:http/http.dart' as http;

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser fireBaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void signUp(
      {@required Map<String, dynamic> userData,
        @required String pass,
        @required VoidCallback onSuccess,
        @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
        email: userData["email"], password: pass)
        .then((user) async {
      fireBaseUser = user;

      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  Future signIn(
      {@required String email,
        @required String pass,
        @required VoidCallback onSuccess,
        @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then((user) async {
      fireBaseUser = user;

      await _loadCurrentUser();
      String teste = await apiRequest();
      print(teste);
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  Future<String> apiRequest() async {
    // set up POST request arguments
    var url = 'http://postoapi.com.preview.my-hosting-panel.com/api/Login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"login": "lucas", "password": "123456789"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    //int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    //String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }


    //var url = 'http://postoapi.com.preview.my-hosting-panel.com/api/Login';
    //var response = await http.post(url, body: {'login': 'lucas', 'password': '123456789'});
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    return response.body;
  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    fireBaseUser = null;

    notifyListeners();
  }

  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return fireBaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection("users")
        .document(fireBaseUser.uid)
        .setData(userData);
  }

  Future<Null> _loadCurrentUser() async {
    if (fireBaseUser == null)
      fireBaseUser = await _auth.currentUser();
    else {
      if (userData["name"] == null) {
        DocumentSnapshot docUser = await Firestore.instance
            .collection("users")
            .document(fireBaseUser.uid)
            .get();
        userData = docUser.data;
      }
    }

    notifyListeners();
  }
}
