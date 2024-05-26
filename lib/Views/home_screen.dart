import 'package:firebase_app/Controllers/auth_controller.dart';
import 'package:firebase_app/Views/Utils/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: Obx(
              () => authController.loader.value
                  ? CircularProgressIndicator()
                  : Icon(Icons.logout),
            ),
          ),
        ],
        title: Text(
          "Home Screen",
          style: CustomTextStyles.appBarStyle,
        ),
      ),
    );
  }
}
