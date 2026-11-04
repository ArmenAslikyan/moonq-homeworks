import 'package:cakes_menu/cors/types.dart';
import 'package:cakes_menu/ui/widgets/type_item.dart';
import 'package:flutter/material.dart';

class CakesMenuBody extends StatefulWidget {
  const CakesMenuBody({super.key});

  @override
  State<CakesMenuBody> createState() => _CakesMenuBodyState();
}

class _CakesMenuBodyState extends State<CakesMenuBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: types.length,
                itemBuilder: (context, index) {
                  final type = types[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Material(
                      color: type.chosen ? const Color(0xffe27177) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            for (var i = 0; i < types.length; i++) {
                              types[i].chosen = i == index;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Center(
                            child: Text(
                              type.text,
                              style: TextStyle(
                                color: type.chosen ? Colors.white : Colors.black,
                              ),
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            TypeItem(
              type: types.firstWhere((type) => type.chosen),
            ),
          ],
        ),
      ),
    );
  }
}