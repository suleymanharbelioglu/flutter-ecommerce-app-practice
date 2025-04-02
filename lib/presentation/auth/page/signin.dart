import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
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
            _createAccount(),
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
      controller: _emailCon,
      decoration: InputDecoration(hintText: "Enter email"),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(onPressed: () {}, title: "Continue");
  }

  Widget _createAccount() {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Don't you hava an account? "),
          TextSpan(
            text: "Create one",
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                  },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
