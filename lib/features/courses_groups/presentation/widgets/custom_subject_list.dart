import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_group_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_search_widget.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

import '../manager/public_course_cubit.dart';

class CustomSubjectList extends StatelessWidget with SearchVariables {
  CustomSubjectList(
      {super.key,
      this.isPublicTeacher = false,
      this.isCourse = true,
      this.isTeacher = true,
      this.teacherId = 94});
  final bool? isPublicTeacher;
  final int? teacherId;
  final bool? isTeacher;
  final bool isCourse;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.7 / 0.5,
        // height: 130.h,
        child: BlocBuilder<SubjectsCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return const SizedBox.shrink();
            }
            if (state is LoadedState && state.data.isEmpty) {
              return const SizedBox.shrink();
            }
            return CustomListView(
              axisDirection: Axis.horizontal,
                padding: getPadding(top: 20.h, start: 10.w),
                itemCount: state is LoadedState
                    ? state.data.length
                    : AppConstants.shimmerItems,
                widget: (context, index) => state is LoadedState
                    ? _buildItem(
                        state.data[index],
                        index,
                      )
                    : Padding(
                        padding: getPadding(end: 5.w),
                        child: CustomShimmer.fromRectangle(
                          height: 120.h,
                          width: 125.w,
                        ),
                      ));
          },
        ));
  }

  _buildItem(
    PublicDataModel model,
    int index,
  ) =>
      BlocBuilder<CoursesGroupOperationCubit, CubitStates>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              context
                  .read<CoursesGroupOperationCubit>()
                  .onSelectedSubjectIndex(index);
              if (isCourse) {
                if (isPublicTeacher.isTrue) {
                  print(
                      'courseController>?>>>>>>>>>>>${AppService().getBlocData<PublicCourseCubit>().teacherName}');
                  AppService()
                      .getBlocData<PublicCourseCubit>()
                      .getPublicCourses(
                        dataModel: TeacherModel(
                            subjectId: model.id,
                            teacherName: courseController.isNotNull
                                ? courseController.text
                                : null),
                      );
                } else {
                  AppService()
                      .getBlocData<CoursesDetailsCubit>()
                      .getCoursesDetails(
                          TeacherModel(subjectId: model.id, teacherId: 94));
                }
              } else {
                if (isPublicTeacher.isTrue) {
                  AppService().getBlocData<PublicGroupCubit>().getPublicGroups(
                        dataModel: TeacherModel(
                            subjectId: model.id,
                            teacherName: groupController.isNotNull
                                ? groupController.text
                                : null),
                      );
                }
                if (isTeacher.isTrue) {
                  AppService()
                      .getBlocData<TeachersOfStudentCubit>()
                      .getTeacherOfStudent(
                          teacher: TeacherModel(
                        subjectId: model.id,
                        // teacherName: courseController.isNotNull
                        //     ? courseController.text
                        //     : null
                      ));
                } else {
                  AppService()
                      .getBlocData<GroupDetailsCubit>()
                      .getGroupDetails(teacherId: 94, subjectId: model.id);
                  // TeacherModel( teacherId: 94));
                }
              }
              // else {
              // if (context.read<CoursesGroupOperationCubit>().publicTapIndex ==
              //     0) {
              //   AppService()
              //       .getBlocData<CoursesCubit>()
              //       .getCourser(model: TeacherModel(subjectId: model.id));
              // } else {
              //   AppService()
              //       .getBlocData<GroupsCubit>()
              //       .getGroups(subjectId: model.id);
              // }
              // }
            },
            child: Column(
              children: [
                Expanded(
                  child: CustomCard(
                      margin: getMargin(
                        horizontal: 5.w,
                      ),
                      backgroundColor: AppColors.mainAppColor.withOpacity(0.9),
                      padding: getPadding(vertical: 20.h, horizontal: 20.w),
                      child: CustomNetworkImage.rectangle(
                        imageUrl: '${EndPoints.url}${model.image!}',
                        // height: 40.h,
                        // width: 40.w,
                      )),
                ),
                5.vs,
                CustomTextWidget(
                  text: model.name!,
                  style: getRegularTextStyle(
                      fontSize: 16,
                      color: context
                                  .read<CoursesGroupOperationCubit>()
                                  .selectedIndex ==
                              index
                          ? AppColors.mainAppColor
                          : AppColors.black),
                )
              ],
            ),
          );
        },
      );
}
