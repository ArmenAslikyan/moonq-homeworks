import 'package:flutter/material.dart';
import 'package:restaurant_menu/models/food.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key, required this.foodItem, required this.onDone});
  final Food foodItem;
  final ValueChanged<double> onDone;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool addCart = false;
  bool isDone = false;
  int quantity = 1;
  int chosen = 0;
  double get price => widget.foodItem.price;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 15, //stver
      color: Color(0xfffffbf5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 82,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Image.asset(
                widget.foodItem.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 2, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.foodItem.name,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                ),
                Text(
                  widget.foodItem.descrption,
                  maxLines: 3,
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${(price * (addCart ? quantity : 1)).toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Color(0xffff820e),
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    if (!addCart)
                      InkWell(
                        onTap: () {
                          setState(() {
                            addCart = true;
                            quantity = 1;
                          });
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: circleButton('+'),
                      ),
                  ],
                ),
                if (addCart && !isDone) ...[
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            } else {
                              addCart = false;
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: circleButton('-'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '$quantity',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: circleButton('+'),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  actionButton(
                    text: 'Done',
                    onPressed: () {
                      widget.onDone(price * (quantity - chosen));
                      setState(() {
                        chosen = quantity;
                        isDone = true;
                      });
                    },
                  ),
                ],
                if (addCart && isDone)
                  actionButton(
                    text: 'Edit',
                    onPressed: () {
                      setState(() {
                        isDone = false;
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circleButton(String text) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: Color(0xffff820e),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget actionButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xffff820e),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          minimumSize: Size(0, 24),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}