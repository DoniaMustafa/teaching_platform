import '../export/export.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({super.key, required this.asset,  this.width,  this.height});
final String asset;
final double? width;
final double? height;
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(asset),width:width ,height:height ,fit: BoxFit.fill,);
  }
}
