import 'package:flutter/material.dart';

class CustomChipList<T> extends StatelessWidget {
  const CustomChipList({
    Key? key,
    required this.values,
    required this.chipBuilder,
  }) : super(key: key);

  final List<T> values;
  final Widget Function(T) chipBuilder;

  List<Widget> _buildChipList() {
    final List<Widget> items = [];
    for (T value in values) {
      items.add(chipBuilder(value));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: _buildChipList());
  }
}
