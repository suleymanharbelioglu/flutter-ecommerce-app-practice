import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/presentation/auth/page/gender_and_age_selection_page.dart';
import 'package:ecommerce/presentation/auth/page/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signUpText(),
              SizedBox(height: 20),
              _firstNameField(),
              SizedBox(height: 20),
              _lastNameField(),
              SizedBox(height: 20),
              _emailField(),
              SizedBox(height: 20),
              _passwordField(),
              SizedBox(height: 20),
              _continueButton(context),
              SizedBox(height: 20),
              _Signin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpText() {
    return Text(
      "Sign up",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameField() {
    return TextField(
      controller: _firstNameCon,
      decoration: InputDecoration(hintText: "Firstname"),
    );
  }

  Widget _lastNameField() {
    return TextField(
      controller: _lastNameCon,
      decoration: InputDecoration(hintText: "Lastname"),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: "Email Adress"),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, GenderAndAgeSelectionPage());
      },
      title: "Continue",
    );
  }

  Widget _Signin(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Don you hava an account? "),
          TextSpan(
            text: "Signin",
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SigninPage());
                  },
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
