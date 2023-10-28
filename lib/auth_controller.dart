import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:health/pages/navigation_bar/home_page.dart';
import 'package:health/pages/login_page.dart';

class AuthController extends GetxController {
  //AuthController.intsance..
  static AuthController instance = Get.find();
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  void register(String email, password, name, phone, gud1, gud2) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // ignore: avoid_print
      print("User is Registered");
      FirebaseFirestore.instance
          .collection("user")
          .doc(userCredential.user!.email)
          .set({
        "Username": name,
        "Phone no": phone,
        "Email": email,
        "Password": password,
        "1st Guardian no": gud1,
        "2nd Guardian no": gud2,
        "uid": auth.currentUser!.uid
      });
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
