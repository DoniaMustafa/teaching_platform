import '../export/export.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.icon, this.size, this.color});
  final IconData? icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,

    );
  }
}
