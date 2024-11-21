import 'package:teaching/core/export/export.dart';


class BuildExamItem extends StatelessWidget {
  const BuildExamItem({
    super.key,
    this.passedExam,
    this.notPassedExam,
  });
  final PassedExam? passedExam;
  final NotPassedExam? notPassedExam;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: CustomListTile(
        isBorder: false,
        style: getSemiboldTextStyle(
            fontSize: 16, fontFamily: FontFamilies.dubaiFamily),
        isCircle: false,
        padding: getPadding(horizontal: 15.w, vertical: 10.h),
        dividerHeight: 82.5.h,
        radiusDirectional:const BorderRadiusDirectional.all(Radius.circular(0)),
        // isDivider: t,
        title:
            passedExam.isNotNull ? passedExam!.title! : notPassedExam!.title!,
        subtitle: passedExam.isNotNull
            ? passedExam!.stubjectName ?? 'subject'
            : notPassedExam!.stubjectName ?? 'subject',
        image: AppAssets().exam,
      ),
    );
  }
}
