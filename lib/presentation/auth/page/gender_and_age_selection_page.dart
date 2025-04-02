import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tellUs(),
                SizedBox(height: 30),
                _genders(context),
                SizedBox(height: 30),
                _howOld(),
                SizedBox(height: 30),
                _age(),
              ],
            ),
          ),
          Spacer(),
          _finishButton(context),
        ],
      ),
    );
  }

  Widget _tellUs() {
    return Text(
      "Tell us about yourself",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return Row(
      children: [
        _genderTile(context, 1, "Man"),
        SizedBox(width: 20),
        _genderTile(context, 2, "Women"),
      ],
    );
  }

  Expanded _genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _howOld() {
    return Text(
      "How old are you ?",
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    );
  }

  Widget _age() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Age Range"), Icon(Icons.keyboard_arrow_down)],
        ),
      ),
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(child: BasicAppButton(onPressed: () {}, title: "Finish")),
    );
  }
}
