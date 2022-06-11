import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  final void Function() onPress;
  const FloatingAddButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: const Icon(Icons.add, size: 32),
    );
  }
}
