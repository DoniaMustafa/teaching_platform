import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';

class BuildListOfLessons extends StatelessWidget {
  const BuildListOfLessons({super.key, required this.model});
  final TeacherModel model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomListView(
        axisDirection: Axis.vertical,
        shrinkWrap: true,
        padding: getPadding(vertical: 30.h, horizontal: 10.w),
        itemCount: model.teacherCourses!.length,
        // scroll: NeverScrollableScrollPhysics(),
        separatorWidget: (context, index) => 20.vs,
        widget: (context, index) => ExpansionTileDropDown(
            subTitle: '${model.teacherCourses![index].lessonsCount!.toString()}'
                '${model.teacherCourses![index].lessonsCount! > 1 ? AppStrings().lessons.trans : AppStrings().lesson.trans}',
            leadingWidget:const CustomIcon(
              icon: Icons.lock,
            ),
            titleStyle: getBoldTextStyle(
              fontSize: 16,
            ),
            borderColor: AppColors.transparent,
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4)
            ],
            price: model.teacherCourses![index].price.toString(),
            isSubscribed: model.teacherCourses![index].isSubscribed,
            items: model.teacherCourses![index].courseLessons!,
            isText: false,
            onSelected: (int id) {
              context.read<LessonsDetailsCubit>().getLessons(lessonId: id);
              Routes.lessonDetailsRoute.moveTo;

              // selectedCountryId = id;
              // context.read<EducationCubit>().getEducationPrograms(id: id);
            },
            unselectedColor: AppColors.white,
            title: context.read<LanguageCubit>().isEn.isTrue
                ? model.teacherCourses![index].titleEn!
                : model.teacherCourses![index].title!,
            status: ListStatus.listLoaded),
      ),
    );
  }
}
