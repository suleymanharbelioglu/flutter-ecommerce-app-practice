import 'package:ecommerce/common/helper/image/image_display.dart';
import 'package:ecommerce/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  ImageDisplayHelper.generateProductImageURL(
                    productEntity.images[index],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: productEntity.images.length,
      ),
    );
  }
}
