import 'package:firebase_app/Controllers/auth_controller.dart';
import 'package:firebase_app/Views/Utils/Styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/Components/common_field.dart';
import '../Utils/Components/login_button.dart';
import '../Utils/Styles/text_styles.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailcontroller = TextEditingController();
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Forgot password',
                  style: CustomTextStyles.appBarStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Enter your email to forgot password',
                  style: CustomTextStyles.smallGreyColorStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  ketboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "Email must be given";
                    } else {
                      return null;
                    }
                  },
                  obsecureText: false,
                  hintText: 'johndoe@example.com',
                ),
                const SizedBox(
                  height: 25,
                ),
                CommonButton(
                  onPressed: () {
                    authController.resetPassword(emailcontroller.text);
                  },
                  child: Obx(
                    () => authController.loader.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.whiteColor,
                            ),
                          )
                        : Text(
                            'Submit',
                            style: CustomTextStyles.commonButtonStyle,
                          ),
                  ),
                ),
              ],
            ),
            const Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.grey,
                  size: 30,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "You will recieve an email that will caontain a token to recover the forgot password!",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: CustomTextStyles.smallGreyColorStyle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
