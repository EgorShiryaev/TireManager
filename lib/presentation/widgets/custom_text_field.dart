import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  void onEditingComplete() => FocusScope.of(context).nextFocus();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: Theme.of(context).textTheme.caption,
        onEditingComplete: onEditingComplete,
        cursorColor: Colors.black12,
        decoration: const InputDecoration(hintText: 'Логин')
            .applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}
