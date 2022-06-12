import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style:
              Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
