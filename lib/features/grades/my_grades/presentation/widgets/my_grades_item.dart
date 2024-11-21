import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/grades/my_grades/data/models/my_grades_model.dart';
import 'package:teaching/features/grades/my_grades/presentation/manager/my_grades_cubit.dart';

class MyGradesItem extends StatelessWidget {
  const MyGradesItem({super.key, required this.index, required this.model});
  final StudentDegreesDataModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomListTile(
        padding: getPadding(
          vertical: 10,
          horizontal: 15.w,
        ),
        isBorder: false,
        isDivider: false,
        isCircle: false,
        style: getBoldTextStyle(fontSize: 16),
        color: AppColors.transparent,
        image: AppAssets().grades,
        title: model.subjectName!,
        subtitle: model.examTitle!,
        followers: '${model.studentDegree!} / ${model.examDegree!}',
        widget: SizedBox(
          width: 80.w,
          child: CircularPercentIndicator(
            radius: 25.0,
            lineWidth: 5.0,
            percent:
                AppService().getBlocData<MyGradesCubit>().degree[index] == 100
                    ? 1.0
                    :double.parse('0.${AppService().getBlocData<MyGradesCubit>().degree[index]}'),
            center: CustomTextWidget(
                text: AppService()
                    .getBlocData<MyGradesCubit>()
                    .degree[index]
                    .toString()),
            progressColor: Colors.green,
          ),
        ));
  }
}
