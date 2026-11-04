import 'package:cars_menu/presentation/widgets/car_widget.dart';
import 'package:flutter/material.dart';
import 'package:cars_menu/cors/cars.dart';

class CarsMenuStartPage extends StatelessWidget {
  const CarsMenuStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 370,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 24),
          itemCount: cars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 22,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return CarWidget(car: cars[index]);
          },
        ),
      ),
    );
  }
}
