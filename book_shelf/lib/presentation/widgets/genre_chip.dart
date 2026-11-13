import 'package:book_shelf/models/genre.dart';
import 'package:flutter/material.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    Key? key,
    this.genre,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final Genre? genre;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    final isNull = genre == null;
    final name = isNull ? 'Բոլորը' : genre!.name;
    final icon = isNull ? Icons.all_inclusive : genre!.icon;

    return ChoiceChip(
      avatar: Icon(icon),
      label: Text(name),
      selected: selected,
      onSelected: onSelected,
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      labelStyle: TextStyle(
        color: selected
            ? Theme.of(context).colorScheme.onPrimaryContainer
            : Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
