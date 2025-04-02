import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_signin_req.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<Either> signin(UserSigninReq user);
}
