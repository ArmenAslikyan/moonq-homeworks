import 'package:cars_menu/models/car.dart';
import 'package:flutter/material.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 48,
              child: Image.network(car.imageurl, fit: BoxFit.cover),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 48,
              child: Container(
                color: const Color(0xff151a20),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  car.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xffe3e4e8),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
