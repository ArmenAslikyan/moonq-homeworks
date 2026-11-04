import 'package:flutter/material.dart';
import 'package:nike/ui/widgets/shoe_card.dart';
import 'package:nike/ui/widgets/shoe_color.dart';
import 'package:nike/ui/widgets/size_card.dart';

class NikeStoreScreen extends StatelessWidget {
  const NikeStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f6f7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f6f7),
        title: Image.network(
          'https://pngimg.com/uploads/nike/nike_PNG5.png',
          width: 90,
          height: 70,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image_not_supported),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, size: 30),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Icon(Icons.search),
                SizedBox(width: 30),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromARGB(255, 42, 41, 41),
                  child: Icon(
                    Icons.person_2_rounded,
                    color: Color(0xFFf8f6f7),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xffdfdfdf),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    'https://i.postimg.cc/7PJMWrqv/image-removebg-preview.png',
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.2, 0.5),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                ShoeCard(
                  image: Image.network(
                    'https://i.postimg.cc/7PJMWrqv/image-removebg-preview.png',
                  ),
                ),
                ShoeCard(
                  image: Image.network(
                    'https://i.postimg.cc/XJWwtpLF/image-removebg-preview-(1).png',
                  ),
                ),
                ShoeCard(
                  image: Image.network(
                    'https://i.postimg.cc/SsmMDHQG/image-removebg-preview-(2).png',
                  ),
                ),
                ShoeCard(
                  image: Image.network(
                    'https://i.postimg.cc/RZfJ9vNL/image-removebg-preview-(3).png',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0xffe2e7ee),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [ 
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nike Air Zoom Pegasus 40',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: const [
                          Text(
                            '\$149.99',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 120),
                          Text(
                            'Վարկանիշ՝ 4.7',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xffe2e7ee),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Material(
                          color: const Color(0xff23456b),
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            splashColor: const Color.fromARGB(255, 64, 116, 175),
                            highlightColor:
                                const Color.fromARGB(255, 64, 116, 175)
                                    .withOpacity(0.15),
                            onTap: () {
                              debugPrint('Item was added to the Cart');
                            },
                            child: const SizedBox(
                              height: 40,
                              width: 280,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizeCard(color: Color(0xff23456b), text_color: Colors.white, size: '7'),
                          SizeCard(color: Color(0xffe2e7ee), text_color: Colors.black, size: '7.5'),
                          SizeCard(color: Color(0xffe2e7ee), text_color: Colors.black, size: '8'),
                          SizeCard(color: Color(0xffe2e7ee), text_color: Colors.black, size: '8.5'),
                          SizedBox(width: 10),
                          ShoeColor(borderColor: Color(0xff23456b), color: Color.fromARGB(255, 57, 111, 173)),
                          ShoeColor(borderColor: Color(0xff7d7d7c), color: Color(0xff7d7d7c)),
                          ShoeColor(borderColor: Color.fromARGB(255, 174, 176, 180), color: Color(0xffe4e7ee)),
                          ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                'Nike Air Zoom Pegasus 40-ը կատարյալ ընտրություն է առօրյա վազքի համար։ '
                'Նրա թեթև դիզայնը և React տեխնոլոգիայով փրփուրը ապահովում են '
                'առավելագույն հարմարավետություն և ամորտիզացիա ամեն քայլափոխի։ '
                'Հարմարեցված է թե՛ սկսնակների, թե՛ փորձառու վազորդների համար։',
              style: TextStyle(fontSize: 16)
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xfff8f7f7),
            border: Border(
              top: BorderSide(
                color: Color.fromARGB(255, 202, 190, 190),
                width: 1,
              ),
            ),
          ),
          child: const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12),
              child: Row(
                children: [
                  InkWell(child: Icon(Icons.home, color: Color(0xff23456b), size: 25)),
                  SizedBox(width: 80),
                  
                  InkWell(child: Icon(Icons.search, color: Color.fromARGB(255, 134, 131, 131))),
                  SizedBox(width: 80),

                  InkWell(child: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 134, 131, 131))),
                  SizedBox(width: 80),

                  InkWell(child: Icon(Icons.person, color: Color.fromARGB(255, 134, 131, 131)))
                ],
              ),
            )
          ),
        ),
    );
  }
}
