import 'package:ecommerce/domain/auth/usecase/get_user.dart';
import 'package:ecommerce/presentation/home/bloc/user_info_diplay_state.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoDiplayCubit extends Cubit<UserInfoDiplayState> {
  UserInfoDiplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadUserInfoFailure());
      },
      (data) {
        emit(UserInfoLoaded(user: data));
      },
    );
  }
}
