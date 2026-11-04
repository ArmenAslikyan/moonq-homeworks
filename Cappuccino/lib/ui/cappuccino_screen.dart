import 'package:capuchino/ui/widgets/like_button.dart';
import 'package:capuchino/ui/widgets/size_choose.dart';
import 'package:flutter/material.dart';

class CappuccinoScreen extends StatefulWidget {
  const CappuccinoScreen({super.key});

  @override
  State<CappuccinoScreen> createState() => _CappuccinoScreenState();
}

class _CappuccinoScreenState extends State<CappuccinoScreen> {
  bool addedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coffee details',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
        )
        ),
        leading: Icon(Icons.arrow_back),
        actions: [
          LikeButton(),
          SizedBox(width: 20),
        ],
        
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQv5wodedhe3klxWZvdfgkkX3TAfSfuzIhy4efAeH3bKPlpxApC',
              fit: BoxFit.fitWidth)
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text('Cappuccino', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  )
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 120),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xfffcf7db),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          SizedBox(width: 5),
                          Text('4.8', style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w900,
                            fontSize: 16
                          )
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'With oat milk and cinnamon',
                style: TextStyle(
                  color: const Color.fromARGB(255, 122, 122, 122),
                  fontSize: 17,
                  fontWeight: FontWeight.w400
                )
              ),
            ),
            SizeChoose(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A classic Italian coffee drink made with equal parts espresso, steamed milk, and milk foam. Topped with a light dusting of cinnamon for a warm, cozy finish.',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 122, 122, 122),
                      fontSize: 17,
                      fontWeight: FontWeight.w400
                    )
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          setState(() {
            addedToCart = !addedToCart;
          });
        },
        child: Container(
          height: 60,
          color: addedToCart
              ? Colors.green
              : const Color.fromARGB(221, 106, 106, 106),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                addedToCart ? Icons.check : Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                'Add to cart',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
