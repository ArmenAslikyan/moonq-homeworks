import 'package:color_change/color_change_base.dart';
import 'package:color_change/provider/color_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider<ColorProvider>(
      create: (context) => ColorProvider(),
      child: const ColorChangeBase(),
    ),
  );
}