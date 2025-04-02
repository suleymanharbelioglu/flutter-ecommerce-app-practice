import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/presentation/auth/page/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          SizedBox(height: 30),
          _sentEmail(),
          SizedBox(height: 30),
          _returnToLoginButton(context),
        ],
      ),
    );
  }

  _emailSending() {
    return Center(child: SvgPicture.asset(AppVectors.emailSending));
  }

  _sentEmail() {
    return Center(child: Text("We Sent you an Email to reset your password."));
  }

  _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, SigninPage());
      },
      width: 200,
      title: "Return To Login",
    );
  }
}
