import 'package:ecommerce/domain/product/entity/product.dart';
import 'package:ecommerce/domain/product/usecase/add_and_remove_favorite_products.dart';
import 'package:ecommerce/domain/product/usecase/is_favorite.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  Future<void> isFavorite(String productId) async {
    print("is favorite");
    var result = await sl<IsFavoriteUseCase>().call(params: productId);
    emit(result);
  }

  Future<void> onTap(ProductEntity product) async {
    print("on tap");
    var result = await sl<AddAndRemoveFavoriteProductsUseCase>().call(
      params: product,
    );

    result.fold((error) {}, (data) {
      emit(data);
    });
  }
}
