import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/data/category/repository/category.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecase/get_ages.dart';
import 'package:ecommerce/domain/auth/usecase/get_user.dart';
import 'package:ecommerce/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce/domain/auth/usecase/send_password_reset_email.dart';
import 'package:ecommerce/domain/auth/usecase/signin.dart';
import 'package:ecommerce/domain/auth/usecase/signup.dart';
import 'package:ecommerce/domain/category/repository/category.dart';
import 'package:ecommerce/domain/category/usecase/get_categories.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  //usecases
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
}
