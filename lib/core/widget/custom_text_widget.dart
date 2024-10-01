import '../export/export.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.text,
      this.style, this.overflow,
       this.align,  this.textScalar,
       this.lines});
  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final TextScaler? textScalar;
  final int? lines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textScaler: textScalar??const TextScaler.linear(1),
      textAlign: align,
      maxLines: lines,overflow:overflow ,
    );
  }
}
