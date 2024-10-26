

import 'package:teaching/core/export/export.dart';

class BuildGroupDetailsHeaderComponent extends StatelessWidget {
  const BuildGroupDetailsHeaderComponent({super.key, required this.model});
  final GroupDetailsDataModel model;

  @override
  Widget build(BuildContext context) {
    return CustomHeader(image: '${EndPoints.url}${model.teacherPicture}',name: model.teacherName!,
      subjectLabel: model.subjectName!,
      gradeLabel: model.gradeName!,
      labelType: AppStrings().groups.trans,
    );

  }
}
