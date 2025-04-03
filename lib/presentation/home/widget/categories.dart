import 'package:ecommerce/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce/common/bloc/categories/categories_display_state.dart';
import 'package:ecommerce/common/helper/image/image_display.dart';
import 'package:ecommerce/domain/category/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _seeAll(context),
                SizedBox(height: 20),
                _categories(state.categories),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget _seeAll(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              //all categories page
            },
            child: Text(
              "See All",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      ImageDisplayHelper.generateCategoryImageURL(
                        categories[index].image,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                categories[index].title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemCount: categories.length,
      ),
    );
  }
}
