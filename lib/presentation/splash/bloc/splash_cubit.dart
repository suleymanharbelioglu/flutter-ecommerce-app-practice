import 'package:ecommerce/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    // var isLogedIn = Random().nextBool();
    // if (isLogedIn) {
    //   emit(Authenticated());
    // } else {
    //   emit(UnAuthenticated());
    // }
    emit(UnAuthenticated());
  }
}
