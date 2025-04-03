import 'package:ecommerce/domain/auth/entity/user.dart';

abstract class UserInfoDiplayState {}

class UserInfoLoading extends UserInfoDiplayState {}

class UserInfoLoaded extends UserInfoDiplayState {
  final UserEntity user;

  UserInfoLoaded({required this.user});
}

class LoadUserInfoFailure extends UserInfoDiplayState {}
