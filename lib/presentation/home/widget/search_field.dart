import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        readOnly: true,
        onTap: () {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: SvgPicture.asset(AppVectors.search, fit: BoxFit.none),
          hintText: "search",
        ),
      ),
    );
  }
}
