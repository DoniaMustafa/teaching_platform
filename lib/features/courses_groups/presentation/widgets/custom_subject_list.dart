import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/pages/courses_details_screen.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_group_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/widgets/build_search_widget.dart';
import 'package:teaching/features/grades/my_grades/presentation/manager/my_grades_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/pages/groups_details_screen.dart';
import 'package:teaching/features/home/presentation/manager/groups_cubit.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/my_homework_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/private/presentation/manager/private_groups_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

import '../manager/public_course_cubit.dart';

class CustomSubjectList extends StatefulWidget {
  CustomSubjectList({
    super.key,
    this.isPublicTeacher = false,
    this.isPrivateGroups = false,
    this.isCourse = false,
    this.isNotes = false,
    this.isMyDegrees = false,
    this.isTeacher = false,
    this.isHomework = false,
  });
  final bool? isPublicTeacher;
  final bool? isTeacher;
  final bool? isPrivateGroups;
  final bool? isNotes;
  final bool isCourse;
  final bool isMyDegrees;
  final bool isHomework;
  @override
  State<CustomSubjectList> createState() => _CustomSubjectListState();
}

class _CustomSubjectListState extends State<CustomSubjectList>
    with SearchVariables {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.0 / 0.5,
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
                  .onSelectedSubjectIndex(index, model.name!);
              if (widget.isCourse) {
                if (widget.isPublicTeacher.isTrue) {
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
                      .getCoursesDetails(TeacherModel(
                          subjectId: model.id,
                          teacherId: CoursesDetailsScreen.teacherId));
                }
              } else {
                if (widget.isPublicTeacher.isTrue) {
                  AppService().getBlocData<PublicGroupCubit>().getPublicGroups(
                        dataModel: TeacherModel(
                            subjectId: model.id,
                            teacherName: groupController.isNotNull
                                ? groupController.text
                                : null),
                      );
                }
                if (widget.isTeacher.isTrue) {
                  AppService()
                      .getBlocData<TeachersOfStudentCubit>()
                      .getTeacherOfStudent(
                          teacher: TeacherModel(
                        subjectId: model.id,
                        // teacherName: courseController.isNotNull
                        //     ? courseController.text
                        //     : null
                      ));
                }
                if (widget.isNotes.isTrue) {
                  context.read<NotesCubit>().getNotes(
                          model: TeacherModel(
                        subjectId: model.id,
                      ));
                }
                if (widget.isMyDegrees.isTrue) {
                  context.read<MyGradesCubit>().getMyGrades(
                          model: TeacherModel(
                        subjectId: model.id,
                      ));
                }
                if (widget.isPrivateGroups.isTrue) {
                  context.read<PrivateGroupsCubit>().getPrivateGroups(
                          model: TeacherModel(
                        subjectId: model.id,
                        // teacherName:
                      ));
                }
                if (widget.isHomework.isTrue) {
                  context.read<MyHomeworkCubit>().getMyHomeWork(
                          model: TeacherModel(
                        subjectId: model.id,
                        // teacherName:
                      ));
                } else {
                  AppService().getBlocData<GroupDetailsCubit>().getGroupDetails(
                      teacherId: GroupsDetailsScreen.teacherId,
                      subjectId: model.id);
                  // TeacherModel( teacherId: 94));
                }
              }
            },
            child: CustomCard(
              backgroundColor: AppColors.transparent,
              margin: getPadding(horizontal: 5.w, vertical: 0),
              child: Column(
                children: [
                  Expanded(
                    child: CustomNetworkImage.rectangle(
                      imageUrl: '${EndPoints.url}${model.image!}',
                      width: 60.w,
                      height: 70.h, radius: 10.r,
                      // height: 40.h,
                      // width: 40.w,
                    ),
                    // child: CustomCard(
                    //     margin: getMargin(
                    //       horizontal: 5.w,
                    //     ),
                    //     backgroundColor: AppColors.mainAppColor.withOpacity(0.9),
                    //     padding: getPadding(vertical: 20.h, horizontal: 20.w),
                    //     child: ),
                  ),
                  5.vs,
                  CustomTextWidget(
                    text: model.name!,
                    textScalar: const TextScaler.linear(0.9),
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
            ),
          );
        },
      );
}
