import 'package:teaching/features/notification/presentation/widgets/build_notification_item.dart';

import '../../export/export.dart';

class CustomSharedBody extends StatelessWidget {
  const CustomSharedBody({super.key, required this.widget, this.topMargin});
final Widget widget;
  final double? topMargin;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: getMargin(top: topMargin??55.h),
      radiusDirectional: BorderRadiusDirectional.only(
          topEnd: Radius.circular(20.r), topStart: Radius.circular(20.r)),
      backgroundColor: AppColors.fillColor,
      child: SizedBox(
        child: widget
      ),
    );
  }
}
//
