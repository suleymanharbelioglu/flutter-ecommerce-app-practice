import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/bottom_sheet/app_bottom_sheet.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/domain/auth/usecase/signup.dart';
import 'package:ecommerce/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce/presentation/auth/widget/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ButtonStateCubit()),
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tellUs(),
                    SizedBox(height: 30),
                    _genders(context),
                    SizedBox(height: 30),
                    _howOld(),
                    SizedBox(height: 30),
                    _age(),
                  ],
                ),
              ),
              Spacer(),
              _finishButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs() {
    return Text(
      "Tell us about yourself",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            _genderTile(context, 1, "Man"),
            SizedBox(width: 20),
            _genderTile(context, 2, "Women"),
          ],
        );
      },
    );
  }

  Expanded _genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color:
                context.read<GenderSelectionCubit>().selectedIndex ==
                        genderIndex
                    ? AppColors.primary
                    : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _howOld() {
    return Text(
      "How old are you ?",
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                ],
                child: Ages(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(state), Icon(Icons.keyboard_arrow_down)],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: BasicReactiveButton(
          onPressed: () {
            userCreationReq.gender =
                context.read<GenderSelectionCubit>().selectedIndex;
            userCreationReq.age = context.read<AgeSelectionCubit>().selectedAge;
            context.read<ButtonStateCubit>().execute(
              usecase: SignupUseCase(),
              params: userCreationReq,
            );
          },
          title: "Finish",
        ),
      ),
    );
  }
}
