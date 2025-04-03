
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/domain/auth/usecase/send_password_reset_email.dart';
import 'package:ecommerce/presentation/auth/page/password_reset_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final TextEditingController _emailCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.push(context, const PasswordResetEmailPage());
            }
          },
          child: Padding(
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
      controller: _emailCon,
      decoration: InputDecoration(hintText: "Enter Email"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
              usecase: SendPasswordResetEmailUseCase(),
              params: _emailCon.text,
            );
          },
          title: "Continue",
        );
      },
    );
  }
}
