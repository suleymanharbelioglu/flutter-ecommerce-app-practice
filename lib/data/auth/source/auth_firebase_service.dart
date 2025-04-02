import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
 Future<bool> isLoggedIn();
}


class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
Future<bool>  isLoggedIn() async {
    print("is logged in ...........................");
    print(FirebaseAuth.instance.currentUser);
    if(FirebaseAuth.instance.currentUser != null){
      return true ; 
      
    }
    else {
      return false;
    }
  }
  
}