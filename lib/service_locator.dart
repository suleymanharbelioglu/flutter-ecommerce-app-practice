import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/data/category/repository/category.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/data/order/repository/order.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/data/product/repository/product.dart';
import 'package:ecommerce/data/product/source/product_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecase/get_ages.dart';
import 'package:ecommerce/domain/auth/usecase/get_user.dart';
import 'package:ecommerce/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce/domain/auth/usecase/send_password_reset_email.dart';
import 'package:ecommerce/domain/auth/usecase/signin.dart';
import 'package:ecommerce/domain/auth/usecase/signup.dart';
import 'package:ecommerce/domain/category/repository/category.dart';
import 'package:ecommerce/domain/category/usecase/get_categories.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/domain/product/repository/product.dart';
import 'package:ecommerce/domain/product/usecase/add_and_remove_favorite_products.dart';
import 'package:ecommerce/domain/product/usecase/get_favorite_products.dart';
import 'package:ecommerce/domain/product/usecase/get_products_by_title.dart';
import 'package:ecommerce/domain/product/usecase/get_top_selling.dart';
import 'package:ecommerce/domain/product/usecase/is_favorite.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

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
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetFavoriteProductsUseCase>(
    GetFavoriteProductsUseCase(),
  );
  sl.registerSingleton<GetProductsByTitleUseCase>(GetProductsByTitleUseCase());
  sl.registerSingleton<AddAndRemoveFavoriteProductsUseCase>(
    AddAndRemoveFavoriteProductsUseCase(),
  );
  sl.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
}
