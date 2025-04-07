import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColor({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

       },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(12), 
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Color",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectionCubit, int>(
                  builder: (context, state) {
                    return Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          productEntity.colors[state].rgb[0],
                          productEntity.colors[state].rgb[1],
                          productEntity.colors[state].rgb[2],

                          1,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                SizedBox(width: 15),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
