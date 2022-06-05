import 'package:flutter/material.dart';

class PassworkTextField extends StatefulWidget {
  final TextEditingController controller;
  const PassworkTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PassworkTextField> createState() => _PassworkTextFieldState();
}

class _PassworkTextFieldState extends State<PassworkTextField> {
  bool visible = false;

  void changeVisible() => setState(() => visible = !visible);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: TextField(
        controller: widget.controller,
        style: Theme.of(context).textTheme.caption,
        decoration: InputDecoration(
          hintText: 'Пароль',
          suffixIcon: IconButton(
            onPressed: changeVisible,
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
            color: Colors.grey.shade600,
          ),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
        obscureText: !visible,
      ),
    );
  }
}
