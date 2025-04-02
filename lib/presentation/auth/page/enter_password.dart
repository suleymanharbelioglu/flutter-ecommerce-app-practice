import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EnterPasswordPage extends StatelessWidget {
  EnterPasswordPage({super.key});
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
            _signinText(),
            SizedBox(height: 20),
            _emailFied(),
            SizedBox(height: 20),
            _continueButton(),
            SizedBox(height: 20),
            _resetPassword(),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign in",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailFied() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: "Enter password"),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(onPressed: () {}, title: "Continue");
  }

  Widget _resetPassword() {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Forget password? "),
          TextSpan(
            text: "Reset",
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
