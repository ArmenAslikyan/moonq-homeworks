import 'package:flutter_store/models/customers.dart';
import 'package:flutter_store/models/products.dart';
import 'package:flutter_store/models/shoppingcart.dart';

class Order{
  String orderId;
  Customer customer;
  ShoppingCart cart;
  Order({
    required this.orderId,
    required this.customer,
    required this.cart
  });
  bool processOrder(){
    double finalPrice = cart.calculateTotal();
    if (customer.isVip == true){
      finalPrice *= 0.9;
    }
    if (customer.balance - finalPrice >= 0){
      bool isProcessed = true;
      print('Purchase successfull');
      print('Item list');
      print('|Product    |        Price|');
      print('|___________|_____________|');
      for (Product item in cart.items){
        print('${item.title}             ${item.price}');
      }
      return isProcessed;
    }else {
      bool isProcessed = false;
      print('Not enough balance for purchasing products');
      return isProcessed;
    }
  }
}