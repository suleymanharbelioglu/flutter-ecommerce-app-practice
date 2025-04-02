import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locator.dart';

class IsLoggedInUseCase  extends UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn(); 
  }
}