import 'package:flutter/material.dart';
import 'package:isnta_clone/screen/home.dart';
import 'package:isnta_clone/screen/search.dart';

class InstagramBody extends StatelessWidget {
  final int index;
  const InstagramBody({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const HomeScreen();
    }
    return const SearchScreen();
  }
}
