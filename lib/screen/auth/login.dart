import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/theme.dart';
import 'package:chatty/widget/custom_checkbox.dart';
import 'package:chatty/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(20)
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          loginOtherOption,
                          style: semiBold12spAshGrey,
                        ),
                      ),
                      Expanded(
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(50)
                            ),
                          )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          style: buttonSecondary,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/google_icon.svg',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                google,
                                style: medium14spAshGrey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          style: buttonSecondary,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/apple_icon.svg',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                apple,
                                style: medium14spAshGrey,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

}