import 'package:flutter_svg/flutter_svg.dart';

import '../export/export.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({super.key, required this.asset, this.color});
  final String asset;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      color: color,
      fit: BoxFit.fill,
      matchTextDirection: true,
    );
  }
}
