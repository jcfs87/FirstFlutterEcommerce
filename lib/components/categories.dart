import 'package:e_commerce/constant.dart';
import 'package:e_commerce/components/body.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final List<String> categories;
  final int selectedIndex;

  const Categories({
    Key? key,
    required this.categories,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Text(
        widget.categories[index],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: kTextColor,
        ),
      ),
    );
  }
}