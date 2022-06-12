import 'package:flutter/material.dart';

class DismissibleCard extends StatelessWidget {
  final void Function() onDismissed;
  final int id;
  final void Function() onTapCard;
  final Widget cardContent;
  const DismissibleCard({
    Key? key,
    required this.onDismissed,
    required this.id,
    required this.onTapCard,
    required this.cardContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_forever,
          color: Colors.white,
          size: 32.0,
        ),
      ),
      direction: DismissDirection.endToStart,
      key: Key('${id}'),
      onDismissed: (_) => onDismissed(),
      child: InkWell(
        onTap: onTapCard,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: cardContent,
          ),
        ),
      ),
    );
  }
}
