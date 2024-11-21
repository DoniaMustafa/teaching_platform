import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/grades/my_grades/presentation/manager/my_grades_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/my_homework_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_public_cubit.dart';
import 'package:teaching/features/parent_children/data/models/children_model.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/parent_children/presentation/manager/parent_children_cubit.dart';
import 'package:teaching/features/subscriptions/subscription/presentation/manager/subscription_courses_cubit.dart';
import 'package:teaching/features/subscriptions/subscription/presentation/manager/subscription_groups_cubit.dart';
import 'package:teaching/features/teacher/teachers/presentation/manager/teachers_of_parent_cubit.dart';

class BuildChildrenDropDownList extends StatefulWidget {
  BuildChildrenDropDownList(
      {super.key,
      this.isNotes = false,
      this.isSubscription = false,
      this.isTeacher = false, this.isDegrees = false,
      this.isPublicCourseGroup = false,
      this.isTeachersOfParent = false,
      this.homework = false});
  final bool isNotes;
  final bool isSubscription;
  final bool homework;
  final bool isPublicCourseGroup;
  final bool isTeacher;
  static int? childrenId;
  final bool? isTeachersOfParent;
  final bool? isDegrees;
  @override
  State<BuildChildrenDropDownList> createState() =>
      _BuildChildrenDropDownListState();
}

class _BuildChildrenDropDownListState extends State<BuildChildrenDropDownList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ParentChildrenCubit>().getParentChildren();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentChildrenCubit, CubitStates>(
      builder: (context, state) {
        return Padding(
          padding: getPadding(horizontal: 20.w),
          child: Column(
            children: [
              ExpansionTileDropDown(
                  isChildren: true,
                  items: getItems(state),
                  onSelected: (int id) {
                    BuildChildrenDropDownList.childrenId = id;
                    if (widget.isTeachersOfParent.isTrue) {
                      context.read<TeachersOfParentCubit>().getTeacherOfStudent(
                          teacher: TeacherModel(
                              studentId: BuildChildrenDropDownList.childrenId));
                    }  else if (widget.isDegrees.isTrue) {
                      context.read<MyGradesCubit>().getMyGrades(
                          model: TeacherModel(
                              studentId: BuildChildrenDropDownList.childrenId));
                    }



                    else if (widget.isNotes.isTrue) {
                      context.read<NotesCubit>().getNotes(
                          model: TeacherModel(
                              studentId: BuildChildrenDropDownList.childrenId));
                    } else if (widget.homework.isTrue) {
                      context.read<MyHomeworkCubit>().getMyHomeWork(isParent: true,
                          model: TeacherModel(
                              studentId: BuildChildrenDropDownList.childrenId));
                    } else if (widget.isTeacher.isTrue) {
                      context
                          .read<TeachersOfStudentCubit>()
                          .getTeacherOfStudent(
                              teacher: TeacherModel(
                                  studentId:
                                      BuildChildrenDropDownList.childrenId));
                    } else if (widget.isSubscription.isTrue) {
                      context
                          .read<SubscriptionCoursesCubit>()
                          .getSubscriptionCourses(
                              model: TeacherModel(
                                  studentId:
                                      BuildChildrenDropDownList.childrenId));
                      context
                          .read<SubscriptionGroupsCubit>()
                          .getStudentSubscriptionsGroups(
                              model: TeacherModel(
                                  studentId:
                                      BuildChildrenDropDownList.childrenId));
                    } else if (widget.isPublicCourseGroup.isTrue) {
                      context.read<PublicCourseCubit>().getPublicCourses(
                          dataModel: TeacherModel(
                              studentId: BuildChildrenDropDownList.childrenId));
                      context.read<PublicGroupCubit>().getPublicGroups(
                          dataModel: TeacherModel(
                              studentId: BuildChildrenDropDownList.childrenId));
                    }
                  },
                  title: AppStrings().children.trans,
                  status: getListStatus(state)),
              BlocBuilder<ErrorCubit, ErrorState>(
                builder: (context, state) {
                  return ErrorText(
                    showError: context
                        .read<ErrorCubit>()
                        .errors
                        .contains(Errors.CONFIRM_PASSWORD_ERROR),
                    text: getError[Errors.CONFIRM_PASSWORD_ERROR]!,
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  List<ChildrenData> getItems(CubitStates state) {
    if (state is LoadedState) return state.data;
    return [];
  }

  ListStatus getListStatus(CubitStates state) {
    if (state is FailedState) return ListStatus.listError;
    if (state is LoadedState) return ListStatus.listLoaded;
    return ListStatus.listLoading;
  }
}
