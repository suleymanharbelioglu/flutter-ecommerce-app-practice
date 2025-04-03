import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/data/auth/model/user_signin_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<bool> isLoggedIn();
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> signup(UserCreationReq user);
  Future<Either> sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return const Right("Signin was successfully");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'invalid-email') {
        message = 'Not user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection("Ages").get();

      return Right(returnedData.docs);
    } on FirebaseException catch (e) {
      return Left("firestore exception ${e.message}");
    }
  }

  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email!,
            password: user.password!,
          );

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(returnedData.user!.uid)
          .set({
            "firstName": user.firstName,
            "lastName": user.lastName,
            "email": user.email,
            "gender": user.gender,
            "image": returnedData.user!.photoURL,
            "userId": returnedData.user!.uid,
          });
      return Right("Sign up successfully");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right("Password Reset email is sent");
    } on FirebaseAuthException catch (e) {
      return Left("plesase try again : $e");
    }
  }
}
