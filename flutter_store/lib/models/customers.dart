class Customer{
  final String id;
  String name;
  double _balance;
  bool isVip;
  get balance => _balance;
  Customer({
    required this.id,
    required this.name,
    required this._balance,
    required this.isVip
  });
  void deposit(double amount){
    _balance += amount;
  }
  bool deduct(double amount){
    try {
      assert(_balance - amount >= 0);
      _balance -= amount;
      return true ;
     } on AssertionError{
      return false;
     }
  }
}