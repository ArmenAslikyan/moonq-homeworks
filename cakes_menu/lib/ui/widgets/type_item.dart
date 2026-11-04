import 'package:flutter/material.dart';
import 'package:cakes_menu/models/type.dart';
import 'package:cakes_menu/ui/widgets/card.dart';

class TypeItem extends StatefulWidget {
  const TypeItem({super.key, required this.type});
  final Type type;
  @override
  State<TypeItem> createState() => _TypeItemState();
}

class _TypeItemState extends State<TypeItem> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: widget.type.items.length,
      itemBuilder: (context, index) {
        final item = widget.type.items[index];

        return ProductCard(item: item);
      },
    );
  }
}
