import '../../../../core/export/export.dart';

class BuildExamItem extends StatelessWidget {
  const BuildExamItem(
      {super.key, required this.passedExam, required this.notPassedExam});
  final PassedExam passedExam;
  final NotPassedExam notPassedExam;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: CustomListTile(
        isCircle: false,
        padding: getPadding(horizontal: 15.w, vertical: 20.h),
        isDivider: false,
        title: passedExam.title.isNotNull
            ? passedExam.title!
            : notPassedExam.title!,
        subtitle: passedExam.stubjectName.isNotNull
            ? passedExam.stubjectName!
            : notPassedExam.stubjectName!,
        image: AppAssets().student,
      ),
    );
  }
}
