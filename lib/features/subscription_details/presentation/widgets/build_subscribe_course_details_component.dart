
import '../../../../core/export/export.dart';

class BuildSubscribeCourseDetailsComponent extends StatelessWidget {
  BuildSubscribeCourseDetailsComponent({super.key, required this.model});
  final GroupDetailsDataModel model;

  @override
  Widget build(BuildContext context) {
    return CustomHeader(image: '${EndPoints.url}${model.teacherPicture}',name: model.teacherName!,
      subjectLabel: model.subjectName!,
      gradeLabel: model.gradeName!,
      labelType: AppStrings().courses.trans,
    );

  }
}
