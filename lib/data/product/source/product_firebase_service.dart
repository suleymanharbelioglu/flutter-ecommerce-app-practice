import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductsByTitle(String title);
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getFavoriteProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Products")
              .where("salesNumber", isGreaterThanOrEqualTo: 20)
              .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("please try again");
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Products")
              .where(
                "createdDate",
                isGreaterThanOrEqualTo: DateTime(2024, 07, 25),
              )
              .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("please try again");
    }
  }

  @override
  Future<Either> getFavoriteProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(user!.uid)
              .collection("Favorites")
              .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again");
    }
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Products")
              .where("title", isGreaterThanOrEqualTo: title)
              .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again");
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Products")
              .where("categoryId", isEqualTo: categoryId)
              .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again");
    }
  }
}
