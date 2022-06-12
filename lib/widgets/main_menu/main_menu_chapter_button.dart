import 'package:flutter/material.dart';

class MainMenuChapterButton extends StatelessWidget {
  final String iconFileName;
  final String title;
  final void Function() onTap;
  final bool? needBlackFill;

  const MainMenuChapterButton({
    Key? key,
    required this.iconFileName,
    required this.title,
    required this.onTap,
    this.needBlackFill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/' + iconFileName,
                    color: needBlackFill != null && needBlackFill!
                        ? Colors.black
                        : null,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
