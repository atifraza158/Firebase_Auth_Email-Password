import 'dart:io';

import 'package:firebase_app/Views/AuthScreens/login_screen.dart';
import 'package:firebase_app/Views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool loader = false.obs;

  signUp(String email, String password) async {
    loader.value = true;
    if (email == '' && password == '') {
      loader.value = false;
      Get.snackbar('Warning', "Email & password should not be empty");
    } else {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((_) {
          loader.value = false;
          Get.snackbar('Success', "User Created Successfully");
          Get.to(() => LoginScreen());
        });
      } on FirebaseAuthException catch (e) {
        loader.value = false;
        Get.snackbar('Error', e.toString());
      }
    }
  }

  signIn(String email, String password) async {
    loader.value = true;
    if (email == '' && password == '') {
      loader.value = false;
      Get.snackbar('Warning', "Email & password should not be empty");
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((_) {
          loader.value = false;
          Get.snackbar('Succcess', "Loggedin as ${email}");
          Get.offAll(() => HomeScreen());
        });
      } on SocketException catch (_) {
        Get.snackbar('Error', 'No Internet Connection');
      } on FirebaseAuthException catch (e) {
        loader.value = false;
        Get.snackbar('Error', e.toString());
      }
    }
  }

  signOut() async {
    try {
      loader.value = true;
      await FirebaseAuth.instance.signOut().then((value) {
        loader.value = false;
        Get.snackbar('Succes', "Logout Successfully");
        Get.offAll(() => LoginScreen());
      });
    } on FirebaseAuthException catch (e) {
      loader.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  resetPassword(String email) async {
    try {
      loader.value = true;
      if (email == '') {
        Fluttertoast.showToast(msg: 'email is required');
      } else {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(
          email: email,
        )
            .then((value) {
          loader.value = false;
          Fluttertoast.showToast(msg: "Check your gmail");
          Get.off(() => LoginScreen());
        });
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.code.toString());
    }
  }
}
