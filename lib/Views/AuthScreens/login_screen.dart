import 'package:firebase_app/Controllers/auth_controller.dart';
import 'package:firebase_app/Views/AuthScreens/forget_password.dart';
import 'package:firebase_app/Views/AuthScreens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Utils/Components/common_field.dart';
import '../Utils/Components/login_button.dart';
import '../Utils/Styles/text_styles.dart';
import '../Utils/Styles/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  AuthController authController = Get.put(AuthController());

  bool isLoading = false;
  bool show = false;
  bool loader = false;

  void showPassword() {
    if (show) {
      show = false;
    } else {
      show = true;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    show = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -10,
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
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back',
                    style: CustomTextStyles.titleStyle,
                  ),
                  const Text(
                    'Sign in your account to continue',
                    style: CustomTextStyles.smallGreyColorStyle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Email Id',
                    style: CustomTextStyles.simpleFontFamily,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CommonTextField(
                    ketboardType: TextInputType.emailAddress,
                    hintText: "johndoe@example.com",
                    controller: emailcontroller,
                    validate: (val) {
                      if (val!.isEmpty) {
                        return 'Email can\'t empty';
                      } else {
                        return null;
                      }
                    },
                    obsecureText: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Password',
                    style: CustomTextStyles.simpleFontFamily,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CommonTextField(
                    hintText: "***********",
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
                      icon: show
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: showPassword,
                    ),
                    obsecureText: show ? false : true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ForgetPasswordScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: const Text(
                            'Forgot Password',
                            style: CustomTextStyles.smallThemedColorStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: CommonButton(
                      child: Obx(
                        () => authController.loader.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppTheme.whiteColor,
                                ),
                              )
                            : Text(
                                'Login',
                                style: CustomTextStyles.commonButtonStyle,
                              ),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          authController.signIn(
                            emailcontroller.text,
                            passwordcontroller.text,
                          );
                        }
                      },
                    ),
                  ),
                  // Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 1,
                            color: AppTheme.greyColor,
                          ),
                        ),
                      ),
                      Text(
                        'OR',
                        style: CustomTextStyles.smallGreyColorStyle,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 1,
                            color: AppTheme.greyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Signing With Google UI
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        await authController.signinWithGoogle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.themeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Obx(
                            () => authController.loader.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: AppTheme.whiteColor,
                                    ),
                                  )
                                : Icon(
                                    FontAwesomeIcons.google,
                                    color: AppTheme.whiteColor,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: CustomTextStyles.smallGreyColorStyle,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: const Text(
                    'SignUp',
                    style: CustomTextStyles.smallThemedColorStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
