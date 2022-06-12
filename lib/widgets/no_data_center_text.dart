import 'package:flutter/material.dart';
import 'package:tire_manager/widgets/padding_wrapper.dart';

class NoDataCenterText extends StatelessWidget {
  const NoDataCenterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Center(
        child: Text(
          'Нет данных!\nДля добавления нажмите кнопку в правом нижнем углу!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
