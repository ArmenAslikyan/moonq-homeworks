import 'package:flutter_store/models/customers.dart';
import 'package:flutter_store/models/digital_product.dart';
import 'package:flutter_store/models/physical_product.dart';
import 'package:flutter_store/models/shoppingcart.dart';
import 'package:flutter_store/models/order.dart';

void main() {
  // 1. Ստեղծել ֆիզիկական ապրանք (Laptop)
  PhysicalProduct laptop = PhysicalProduct(
    id: 'prod001',
    title: 'Noutbuk',
    initialPrice: 500,
    weightKg: 2,
    deliveryFeePerKg: 10,
  );

  // 2. Ստեղծել թվային ապրանք (E-Book)
  DigitalProduct ebook = DigitalProduct(
    id: 'prod002',
    title: 'E-Book',
    initialPrice: 20,
    fileSizeMB: 50,
    downloadUrl: 'https://example.com/ebook.pdf',
  );

  // 3. Ստեղծել VIP հաճախորդ 600$ հաշվեկշռով
  Customer customer = Customer(
    id: 'cust001',
    name: 'Հայկ',
    balance: 600,
    isVip: true,
  );

  print('=== Պատվերի մշակման համակարգ ===\n');
  print('Հաճախորդ: ${customer.name}');
  print('VIP կարգավիճակ: ${customer.isVip}');
  print('Սկզբնական հաշվեկշիռ: \$${customer.balance}\n');

  // 4. Ստեղծել զամբյուղ և ավելացնել ապրանքներ
  ShoppingCart cart = ShoppingCart();
  cart.addItem(laptop);
  cart.addItem(ebook);

  print('--- Զամբյուղի պարունակությունը ---');
  print('${laptop.title} - \$${laptop.calculateFinalPrice()} (գինը + առաքում)');
  print('${ebook.title} - \$${ebook.calculateFinalPrice()}');
  print('Ընդամենը առանց զեղչի: \$${cart.calculateTotal()}\n');

  // 5. Ստեղծել պատվեր և մշակել
  Order order = Order(
    orderId: 'order001',
    customer: customer,
    cart: cart,
  );

  bool isSuccess = order.processOrder();

  // 6. Ստուգել արդյունքները
  print('\n--- Ստուգման արդյունքներ ---');
  if (isSuccess) {
    double originalTotal = cart.calculateTotal();
    double discountedTotal = originalTotal * 0.9; // 10% զեղչ VIP-ի համար
    double expectedBalance = 600 - discountedTotal;
    
    print('✓ Պատվերն ընդունված է');
    print('Սկզբնական գումար: \$${originalTotal.toStringAsFixed(2)}');
    print('VIP զեղչ (10%): \$${(originalTotal * 0.1).toStringAsFixed(2)}');
    print('Վճարված գումար: \$${discountedTotal.toStringAsFixed(2)}');
    print('Մնացած հաշվեկշիռ: \$${customer.balance.toStringAsFixed(2)}');
    print('Ակնկալվող հաշվեկշիռ: \$${expectedBalance.toStringAsFixed(2)}');
    print('Ստուգում անցել է: ${(customer.balance - expectedBalance).abs() < 0.01 ? 'ՀԱՅ ✓' : 'ՈՉ ✗'}');
  } else {
    print('✗ Պատվերը մերժվել է');
  }
}
