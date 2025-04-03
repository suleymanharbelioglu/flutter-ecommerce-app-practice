import 'package:ecommerce/core/configs/assets/app_images.dart';
import 'package:ecommerce/domain/auth/entity/user.dart';
import 'package:ecommerce/presentation/home/bloc/user_info_diplay_cubit.dart';
import 'package:ecommerce/presentation/home/bloc/user_info_diplay_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDiplayCubit()..displayUserInfo(),
      child: Padding(
        padding: EdgeInsets.only(top: 40, right: 16, left: 16),
        child: BlocBuilder<UserInfoDiplayCubit, UserInfoDiplayState>(
          builder: (context, state) {
            if (state is UserInfoLoading) {
              return CircularProgressIndicator();
            }
            if (state is UserInfoLoaded) {
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.user, context),
                  // _gender(),
                  // _card(),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                user.image.isEmpty
                    ? AssetImage(AppImages.profile)
                    : NetworkImage(user.image),
          ),
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  _gender() {}

  _card() {}
}
