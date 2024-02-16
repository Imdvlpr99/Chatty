import 'package:chatty/utils/color.dart';
import 'package:chatty/utils/constants.dart';
import 'package:chatty/utils/theme.dart';
import 'package:chatty/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final _phoneNumber = TextEditingController();
  final _email = TextEditingController();
  final _userName = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: white,
          child: Column(
            children: [
              CustomTextField(
                controller: _phoneNumber,
                labelText: phoneNumberHint,
                textInputType: TextInputType.number,
                prefix: Iconsax.call,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: CustomTextField(
                  controller: _email,
                  labelText: emailHint,
                  textInputType: TextInputType.emailAddress,
                  prefix: Iconsax.sms,
                ),
              ),
              CustomTextField(
                controller: _userName,
                labelText: userNameHint,
                textInputType: TextInputType.text,
                prefix: Iconsax.user,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: CustomTextField(
                  controller: _password,
                  labelText: passwordHint,
                  textInputType: TextInputType.text,
                  isObscureText: true,
                  prefix: Iconsax.lock,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {},
                  child: Text(
                    register,
                    style: bold16spWhite,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}