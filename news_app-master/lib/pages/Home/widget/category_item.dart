// as to display Category Item

import 'package:flutter/material.dart';
import 'package:news_app/models/category_mode.dart';

class CategoryItem extends StatelessWidget {

  final CategoryModel categoryModel;

  final int index;
  final Function onItemClick;

  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.index,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        onItemClick(categoryModel);
      },

      child: Container(

        decoration: BoxDecoration(
          color: categoryModel.CategoryColor,

          borderRadius: BorderRadius.only(

            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: index % 2 == 0
                ? const Radius.circular(25)
                : const Radius.circular(0.0),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0.0)
                : const Radius.circular(25),

          ),

        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Image.asset(categoryModel.CategoryImage),

            Text(categoryModel.CategoryTitle,
              style: theme.textTheme.titleMedium,
            ),

          ],
        ),

      ),
    );
  }
}
