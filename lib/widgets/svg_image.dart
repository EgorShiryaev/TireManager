import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets.dart';

class SvgImage extends StatelessWidget {
  final String fileName;
  final double? width;
  final double? heigth;

  const SvgImage({
    Key? key,
    required this.fileName,
    this.width,
    this.heigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SvgPicture.asset(
        Assets.unlockDeviceSvg,
        width: width,
        height: heigth,
      ),
    );
  }
}
