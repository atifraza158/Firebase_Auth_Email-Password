import 'package:firebase_app/Controllers/auth_controller.dart';
import 'package:firebase_app/Views/Utils/Components/common_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Components/login_button.dart';
import '../Utils/Styles/text_styles.dart';
import '../Utils/Styles/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var cpasswordcontroller = TextEditingController();
  var namecontroller = TextEditingController();

  // Confirming the both password fields are same or not
  String? matchPassword(value) {
    if (value!.isEmpty) {
      return 'Confirm Password Field must be filled';
    } else if (passwordcontroller.text.toString() !=
        cpasswordcontroller.text.toString()) {
      return "Password not match";
    } else {
      return null;
    }
  }

  AuthController authController = Get.put(AuthController());

  bool showP = false;
  bool showCP = false;
  void showPassword() {
    if (showP) {
      showP = false;
    } else {
      showP = true;
    }

    setState(() {});
  }

  void showCPassword() {
    if (showCP) {
      showCP = false;
    } else {
      showCP = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -90,
            right: -30,
            child: Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                color: AppTheme.themeColor,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(250)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create account',
                        style: CustomTextStyles.appBarStyle,
                      ),
                      const Text(
                        'Sign up to begin your jounery',
                        style: CustomTextStyles.smallGreyColorStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Full name',
                        style: CustomTextStyles.smallBlackColorStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CommonTextField(
                        controller: namecontroller,
                        ketboardType: TextInputType.text,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Name Field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        obsecureText: false,
                        hintText: 'Your name here',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Email',
                        style: CustomTextStyles.smallBlackColorStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CommonTextField(
                        controller: emailcontroller,
                        hintText: "abc@example.com",
                        ketboardType: TextInputType.emailAddress,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Email must be given";
                          } else {
                            return null;
                          }
                        },
                        obsecureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Password',
                        style: CustomTextStyles.smallBlackColorStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CommonTextField(
                        controller: passwordcontroller,
                        ketboardType: TextInputType.text,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Password field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        icon: IconButton(
                          icon: showP
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: showPassword,
                        ),
                        obsecureText: showP ? false : true,
                        hintText: 'Type pasword here',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Confrim Password',
                        style: CustomTextStyles.smallBlackColorStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CommonTextField(
                        controller: cpasswordcontroller,
                        hintText: "Confirm Password",
                        ketboardType: TextInputType.text,
                        validate: matchPassword,
                        icon: IconButton(
                          icon: showCP
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: showCPassword,
                        ),
                        obsecureText: showCP ? false : true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: CommonButton(
                          onPressed: () {
                            authController.signUp(
                              emailcontroller.text,
                              passwordcontroller.text,
                            );
                          },
                          child: Obx(
                            () => authController.loader.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: AppTheme.whiteColor,
                                    ),
                                  )
                                : Text(
                                    'Signup',
                                    style: CustomTextStyles.commonButtonStyle,
                                  ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Alread a member?",
                            style: CustomTextStyles.smallGreyColorStyle,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Sign-In",
                              style: CustomTextStyles.smallThemedColorStyle,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
