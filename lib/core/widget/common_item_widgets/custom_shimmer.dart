import 'package:teaching/core/widget/shimmer_widget.dart';

import '../../export/export.dart';

class CustomShimmerItemOfList extends StatelessWidget {
  const CustomShimmerItemOfList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer.fromRectangle(
      height: 150.h,
      width: 200,
      borderRadius: BorderRadiusDirectional.circular(10.r),

    );
  }
}
