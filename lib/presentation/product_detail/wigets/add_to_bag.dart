import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/helper/product/product_price.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/domain/product/entity/product.dart';
import 'package:ecommerce/presentation/cart/pages/cart.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.push(context, CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: BasicReactiveButton(
          onPressed: () {},
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(
                builder: (context, state) {
                  var price =
                      ProductPriceHelper.provideCurrentPrice(productEntity) *
                      state;
                  return Text(
                    "\$${price.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  );
                },
              ),
              Text(
                'Add to Bag',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
