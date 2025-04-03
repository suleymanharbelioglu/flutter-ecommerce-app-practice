import 'package:ecommerce/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce/presentation/splash/bloc/splash_state.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    var isLogedIn = await sl<IsLoggedInUseCase>().call();
    if (isLogedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
