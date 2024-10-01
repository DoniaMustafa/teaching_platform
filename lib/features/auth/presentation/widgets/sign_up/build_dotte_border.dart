import 'package:dotted_border/dotted_border.dart';

import '../../../../../core/export/export.dart';

class BuildDottedBorder extends StatelessWidget {
  const BuildDottedBorder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.mainAppColor,
      borderType: BorderType.RRect,
      strokeWidth: 1,
      radius: Radius.circular(10.r),
      dashPattern: [8],
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.r)), child: child),
    );
  }
}
