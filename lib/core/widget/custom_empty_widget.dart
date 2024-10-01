
import 'package:lottie/lottie.dart';

import '../export/export.dart';

class CustomEmptyWidget extends StatelessWidget {
  // final String message;
  const CustomEmptyWidget({ super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAssets().empty,width: 100.w,height: 80.h),
          21.vs,
          // Text(
          //   message,
          //   style: getBoldTextStyle(fontSize: 16),
          // ),
          // 60.vs
        ],
      ),
    );
  }
}
