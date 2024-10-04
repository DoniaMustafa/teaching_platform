import 'package:teaching/core/utils/app_style.dart';

import '../../../../core/export/export.dart';

class BuildOnBoardingBody extends StatelessWidget {
  const BuildOnBoardingBody({super.key, required this.data});
  final GenericModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(start: 52.73.w, end: 73.w),
      child: SingleChildScrollView(

       physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            122.vs,
            Align(
                alignment: Alignment.center,
                child: CustomSvg(asset: data.image!)),
            68.11.vs,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextWidget(
                  text: data.title!,
                  style: getBoldTextStyle(fontSize: 20, height: 1),
                  align: TextAlign.center,
                ),
                18.66.vs,
                CustomTextWidget(
                  text: data.subTitle!,
                  style: getRegularTextStyle(fontSize: 14, height: 1.3),
                  align: TextAlign.center,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
