import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BasicAppbar(title: Text("Cart")));
  }
}
