import 'package:flutter/material.dart';

import '../app_theme.dart';

class FilledContainer extends StatelessWidget {
  final String data;
  const FilledContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: AppTheme.filledCardDecoration,
      child: Text(data, style: Theme.of(context).textTheme.caption),
    );
  }
}
