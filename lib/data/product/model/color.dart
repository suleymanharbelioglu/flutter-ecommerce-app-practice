import 'package:ecommerce/domain/product/entity/color.dart';

class ProductColorModel {
  final String title;
  final List<int> rgb;

  ProductColorModel({required this.title, required this.rgb});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"title": title, "rbg": rgb};
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map["title"],
      rgb: List<int>.from((map["rgb"]).map((e) => e)),
    );
  }
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(title: title, rgb: rgb);
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(title: title, rgb: rgb);
  }
}
