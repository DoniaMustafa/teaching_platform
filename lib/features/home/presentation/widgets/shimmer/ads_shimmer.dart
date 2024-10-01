import 'package:teaching/core/widget/shimmer_widget.dart';

import '../../../../../core/export/export.dart';

class AdsShimmer extends StatelessWidget {
  const AdsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      width: 300.w,
      height: 150.h,
    );
  }
}
