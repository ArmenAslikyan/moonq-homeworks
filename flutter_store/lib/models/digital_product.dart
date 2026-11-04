import 'package:flutter_store/models/products.dart';

class DigitalProduct extends Product{
  double fileSizeMB;
  String downloadUrl;
  DigitalProduct({
    required super.id,
    required super.title,
    required super.initialPrice,
    required this.fileSizeMB,
    required this.downloadUrl
  });
  @override
  double calculateFinalPrice(){
    return super.price;
  }
}