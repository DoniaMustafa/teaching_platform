import 'package:teaching/features/chat/presentation/widgets/custom_online_image.dart';

import '../../../../core/export/export.dart';

class BuildUsersOnlineChat extends StatelessWidget {
  const BuildUsersOnlineChat({
    super.key,
    // required this.label,
    // required this.onTap,
    // required this.image
  });
  // final String label;
  // final String image;

  // final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.2 / 0.9,
      child: CustomListView(axisDirection: Axis.horizontal,
          itemCount: 10,
          widget: (context, index) => GestureDetector(
                // onTap: onTap,
                child: Padding(
                  padding: getPadding(end: 10.w),
                  child: Column(
                    children: [
                      const CustomOnlineImage(),
                      5.vs,
                      CustomTextWidget(
                        text: 'label',
                        style: getRegularTextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
