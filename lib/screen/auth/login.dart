import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/shared_preference.dart';
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
  late String _userName;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  Future<void> _getUserName() async {
    _userName = await SharedPreferencesUtils.getString(userName);
    _emailController.text = _userName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomTextField(
                controller: _emailController,
                labelText: emailUsernameHint,
                textInputType: TextInputType.multiline,
                prefix: Iconsax.sms,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: CustomTextField(
                  controller: _passwordController,
                  labelText: passwordHint,
                  textInputType: TextInputType.visiblePassword,
                  isObscureText: true,
                  prefix: Iconsax.lock,
                ),
              ),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      if (_isRemembered) {
                        SharedPreferencesUtils.setString(userName, _emailController.text);
                      } else {
                        SharedPreferencesUtils.setString(userName, '');
                      }
                    },
                    child: Text(
                      login,
                      style: bold16spWhite,
                    )
                ),
              ),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  children: [
                    Expanded(
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
                    const SizedBox(width: 8),
                    Expanded(
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
                              colorFilter: const ColorFilter.mode(ashGrey, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              apple,
                              style: medium14spAshGrey,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}