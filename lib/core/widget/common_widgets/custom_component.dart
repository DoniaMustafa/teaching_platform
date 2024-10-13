import '../../export/export.dart';

class CustomComponent extends StatelessWidget {
  CustomComponent(
      {super.key,
      required this.labelType,
      required this.gradeLabel,
      required this.subjectLabel});
  final String gradeLabel;
  final String subjectLabel;
  final String labelType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return CustomCard(
          borderWidth: 1,
          borderColor: AppColors.secondBorderColor,
          backgroundColor: AppColors.transparent,
          padding: getPadding(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              const CustomIcon(
                icon: Icons.file_copy_outlined,
                size: 10,
              ),
              20.hs,
              CustomTextWidget(
                text: index == 0
                    ? labelType
                    : index == 1
                        ? gradeLabel
                        : subjectLabel,
                style:
                    getBoldTextStyle(fontSize: 11, color: AppColors.heavyBlack),
              ),
            ],
          ),
        );
      }),
    );
  }
}
