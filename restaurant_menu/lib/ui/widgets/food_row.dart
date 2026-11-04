import 'package:flutter/material.dart';
import 'package:restaurant_menu/models/food.dart';
import 'package:restaurant_menu/ui/widgets/food_card.dart';

class FoodRow extends StatelessWidget {
  const FoodRow({
    super.key,
    required this.foodRow,
    required this.onDone,
    });

  final List<Food> foodRow;
  final ValueChanged<double> onDone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: foodRow.length,
        itemBuilder: (context, index) {
          return FoodCard(
            foodItem: foodRow[index],
            onDone: onDone,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 12);
        },
      ),
    );
  }
}