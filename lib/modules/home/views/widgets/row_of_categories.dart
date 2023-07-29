import 'package:flutter/material.dart';
import 'package:mobile_challenge1/modules/home/views/widgets/category_card.dart';

class RowOfCategories extends StatelessWidget {
  const RowOfCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CategoryCard(text: "Trailers", ),
          CategoryCard(text: "Sinópses",),
          CategoryCard(text: "Reviews",),
          CategoryCard(text: "Discussões",),
        ],
      ),
    );
  }
}
