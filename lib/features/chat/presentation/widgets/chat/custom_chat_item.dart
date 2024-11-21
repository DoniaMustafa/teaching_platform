import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/custom_online_image.dart';

class CustomChatItem extends StatelessWidget {
  const CustomChatItem(
      {super.key,
      required this.name,
      required this.time,
      required this.massage,
      required this.image,
      required this.onTap});
  final String name;
  final String time;
  final VoidCallback onTap;
  final String massage;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomOnlineImage(
            isAvailable: false,
            image: image,
          ),
          10.hs,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: name,
                  style: getRegularTextStyle(
                    fontSize: 14,
                  ),
                ),
                5.vs,
                CustomTextWidget(
                  text: massage,
                  style: getRegularTextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          10.hs,
          CustomTextWidget(
            text: time,
            style: getRegularTextStyle(
                fontSize: 12, fontFamily: FontFamilies.dubaiFamily),
          ),
        ],
      ),
    );
  }
}
