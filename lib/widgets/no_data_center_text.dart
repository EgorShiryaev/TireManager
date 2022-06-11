import 'package:flutter/material.dart';

class NoDataCenterText extends StatelessWidget {
  const NoDataCenterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          'Нет данных!\nДля добавления нажмите кнопку в правом нижнем углу!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
