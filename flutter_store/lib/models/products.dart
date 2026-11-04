abstract class Product{
  final String id;
  final String title;
  double _price;

  Product({
    required this.id,
    required this.title,
    required double initialPrice,
  }) : _price = initialPrice > 0 ? initialPrice : 1.0;
  double get price => _price;
  set price(double newPrice) {
    if (newPrice <= 0) {
      print('Սխալ ($title)․ Գինը չի կարող լինել 0 կամ բացասական։ Արժեքը չփոխվեց։');
    } else {
      _price = newPrice;
    }
  }
  double calculateFinalPrice();

}