import 'package:teaching/core/export/export.dart';

class CustomSubjectList extends StatelessWidget {
  const CustomSubjectList(
      {super.key,
      required this.label,
      required this.onTap,
      required this.image});
  final String label;
  final String image;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 130.h,
        child: CustomListView(
            itemCount: 5,
            widget: (context, index) => Column(
                  children: [
                    Expanded(
                      child: CustomCard(
                          margin: getMargin(horizontal: 5.w),
                          backgroundColor:
                              AppColors.mainAppColor.withOpacity(0.9),
                          padding: getPadding(vertical: 20.h, horizontal: 20.w),
                          child: CustomImageWidget(
                            asset: image,
                            height: 40.h,
                            width: 40.w,
                          )),
                    ),
                    5.vs,
                    CustomTextWidget(
                      text: label,
                      style: getRegularTextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
