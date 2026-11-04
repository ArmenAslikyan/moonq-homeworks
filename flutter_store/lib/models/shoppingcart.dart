import 'package:flutter_store/models/products.dart';

class ShoppingCart{
  final List<Product> _items = [];
  List<Product> get items => _items;
  void addItem(Product product){
    _items.add(product);
  }
  void removeItem(String productId){
    int index = _items.indexWhere((item) => item.id == productId);
    if (index != -1) {
      _items.removeAt(index);
    }
  }
  double calculateTotal(){
    return _items.fold(0.0, (total, product) => total + product.calculateFinalPrice());
  }
}