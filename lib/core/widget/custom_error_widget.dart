import 'package:lottie/lottie.dart';

import '../export/export.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  const CustomErrorWidget(
      {required this.message, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Lottie.asset(AppAssets().error,width: 300.w,height: 100.h)),
          21.vs,
          CustomTextWidget(
            text: message,
            align: TextAlign.center,
            style: getBoldTextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
