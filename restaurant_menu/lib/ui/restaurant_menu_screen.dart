import 'package:flutter/material.dart';
import 'package:restaurant_menu/cors/foods.dart';
import 'package:restaurant_menu/ui/widgets/food_card.dart';

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({super.key});

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    final menuItems = foods.expand((foodRow) => foodRow).take(12).toList();

    return Scaffold(
      backgroundColor: Color(0xfffdf4e5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, right: 20, left: 20, bottom: 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors:
                    [
                      Color(0xffffefde),
                      Color(0xffffdebb)
                    ],
                    stops: [0.1, 0.3]
                  ),
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delicious \nFast Food',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                                Text(
                                  'Get your favorite\nfast food at your door',
                                  style: TextStyle(
                                    fontSize: 11
                                  ),
                                ),
                                SizedBox(height: 20,),
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff820e),
                                      borderRadius: BorderRadius.circular(18)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Order Now',
                                            style: TextStyle(
                                              color: Colors.white
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle
                                              //borderRadius: BorderRadius.circular(12), // or shape: BoxShape.circle
                                            ),
                                            child: Icon(Icons.arrow_forward, color: Color(0xffff820e))
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          )
                      ),
                      SizedBox(width: 1),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Transform.rotate(
                              angle: 10 * 3.145 / 180,
                              child: SizedBox(
                                height: 170,
                                //width: 220,
                                child: Image.asset(
                                  'assets/food.png',
                                  fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Popular Items',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20
                        )
                      ),
                      Spacer(),
                      InkWell(
                        child: Row(
                          children: [
                            Text(
                              'View All',
                              style: TextStyle(
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(width: 7),
                            Icon(Icons.arrow_forward, color: Color(0xffff820e))
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Spacer(),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Color(0xffff820e),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: menuItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 230,
                    ),
                    itemBuilder: (context, index) {
                      return FoodCard(
                        foodItem: menuItems[index],
                        onDone: (amount) {
                          setState(() {
                            totalPrice += amount;
                          });
                        },
                      );
                    },
                  )
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}