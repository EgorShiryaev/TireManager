import 'package:flutter/material.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget child;
  const PaddingWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: child,
    );
  }
}
