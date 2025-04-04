import 'package:ecommerce/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/domain/product/entity/product.dart';
import 'package:ecommerce/domain/product/usecase/get_favorite_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text("My Favorites")),
      body: BlocProvider(
        create:
            (context) =>
                ProductDisplayCubit(useCase: GetFavoriteProductsUseCase())
                  ..displayProducts(),
        child: BlocBuilder<ProductDisplayCubit, ProductDisplayState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return CircularProgressIndicator();
            }
            if (state is ProductLoaded) {
              return _products(state.products);
            }
            if (state is LoadProductFailure) {
              return Center(child: Text("Please try again"));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(productEntity: products[index]);
        },
      ),
    );
  }
}
