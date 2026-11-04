import 'package:flutter_store/models/products.dart';

class PhysicalProduct extends Product{
  double weightKg;
  double deliveryFeePerKg;
  PhysicalProduct({
    required super.id,
    required super.title,
    required super.initialPrice,
    required this.weightKg,
    required this.deliveryFeePerKg
  });
  @override
  double calculateFinalPrice(){
    return super.price + (weightKg * deliveryFeePerKg);
  }
}