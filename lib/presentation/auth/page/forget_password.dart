import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/page/password_reset_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final TextEditingController _passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _forgotPasswordText(),
            SizedBox(height: 20),
            _emailFied(),
            SizedBox(height: 20),
            _continueButton(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _forgotPasswordText() {
    return Text(
      "Forgot Password",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailFied() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: "Enter Email"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, PasswordResetEmailPage());
      },
      title: "Continue",
    );
  }
}
