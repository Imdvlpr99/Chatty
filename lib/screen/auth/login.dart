import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/theme.dart';
import 'package:chatty/widget/custom_checkbox.dart';
import 'package:chatty/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRemembered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: _emailController,
                  labelText: emailHint,
                  textInputType: TextInputType.multiline,
                  prefix: Iconsax.sms,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _passwordController,
                  labelText: passwordHint,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                  prefix: Iconsax.lock,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CustomCheckBox(
                      title: rememberMe,
                      isChecked: _isRemembered,
                      onValueChanged: (bool value) {
                        setState(() {
                          _isRemembered = value;
                        });
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {

                      },
                      child: Text(
                        forgotPassword,
                        style: semiBold12spDarkBlue,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      style: buttonPrimary,
                      onPressed: () {

                      },
                      child: Text(
                        login,
                        style: bold16spWhite,
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}