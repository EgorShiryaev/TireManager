import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  void onEditingComplete() => FocusScope.of(context).nextFocus();

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.caption,
      onEditingComplete: onEditingComplete,
      cursorColor: Colors.black12,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}
