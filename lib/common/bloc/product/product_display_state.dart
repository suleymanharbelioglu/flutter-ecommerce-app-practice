import 'package:ecommerce/domain/product/entity/product.dart';

abstract class ProductDisplayState {}
class ProductIntitialState extends ProductDisplayState {}

class ProductLoading extends ProductDisplayState {}

class ProductLoaded extends ProductDisplayState {
  final List<ProductEntity> products;

  ProductLoaded({required this.products});
}

class LoadProductFailure extends ProductDisplayState {}
