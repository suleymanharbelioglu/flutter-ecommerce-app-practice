import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSize extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSize({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Size",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return BlocBuilder<ProductSizeSelectionCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ProductSizeSelectionCubit>().itemSelection(
                          index,
                        );
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color:
                              state == index
                                  ? AppColors.primary
                                  : AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productEntity.sizes[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            state == index
                                ? Icon(Icons.check, size: 30)
                                : Container(width: 30),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: productEntity.sizes.length,
            ),
          ),
        ],
      ),
    );
  }
}
