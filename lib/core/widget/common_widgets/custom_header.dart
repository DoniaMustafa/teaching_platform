import 'package:teaching/core/export/export.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.image, required this.name, required this.subjectLabel, required this.gradeLabel, required this.labelType});
final String image;
  final String name;
  final String subjectLabel;
  final String gradeLabel;
  final String labelType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNetworkImage.circular(
          imageUrl: image,
          radius: 150.r,
        ),
        12.vs,
        CustomTextWidget(
          text: name,
          style: getBoldTextStyle(
              fontSize: 20, color: AppColors.black.withOpacity(0.65)),
        ),
        10.vs,
        CustomComponent(
          subjectLabel: subjectLabel,
          gradeLabel: gradeLabel,
          labelType:labelType,
        ),
      ],
    );
  }
}
