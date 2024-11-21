import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/presentation/pages/test_yourself_exam_screen.dart';
import 'package:teaching/features/home_work/data/models/home_work_model.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_question_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/my_homework_cubit.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/pages/student_group_sessions_screen.dart';

class BuildTabBarAndTabView extends StatelessWidget {
  const BuildTabBarAndTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeworkOperationCubit, CubitStates>(
      builder: (context, state) {

        return Column(
          children: [
            CustomTabBar(
                onTap: (index) => context
                    .read<HomeworkOperationCubit>()
                    .onChangeTapIndex(index),
                text: AppListsConstant.homeworkTab,
                selectedIndex: context.read<HomeworkOperationCubit>().tapIndex),
            10.vs,
            Expanded(
              child: _buildHomeworkList(),
            )
          ],
        );
      },
    );
  }

  Widget _buildHomeworkList() => BlocBuilder<MyHomeworkCubit, CubitStates>(
        builder: (context, state) {
          if(context.read<MyHomeworkCubit>().isParentRequest.isTrue){

            if (state is FailedState) {
              return CustomErrorWidget(
                onTap: () => context.read<MyHomeworkCubit>().getMyHomeWork(
                    model: TeacherModel(
                        groupId: StudentGroupSessionsScreen.groupId!)),
                message: state.message,
              );
            }
            if (state is LoadedState &&
                (context.read<HomeworkOperationCubit>().tapIndex == 0
                    ? state.data.deliveredHomeworks.isEmpty
                    : state.data.notDeliveredHomeworks.isEmpty)) {
              return const CustomEmptyWidget();
            }
            return CustomListView(
              shrinkWrap: true,
              widget: (context, index) {
                return state is LoadedState
                    ? GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                      case 1:
                        context.read<HomeworkQuestionCubit>().getMyHomeWork(
                          examId: context
                              .read<MyHomeworkCubit>()
                              .notDeliveredHomeworks[index]
                              .homeworkId!,
                        );
                        Routes.examQuestionRoute.moveToWithArgs({
                          ExamQuestionScreen.whichScreenKey:
                          AppStrings().homeWork
                        });
                    }
                  },
                  child: BlocBuilder<HomeworkOperationCubit, CubitStates>(
                    builder: (context, state) {
                      return buildHomeWorkItem(
                          context.read<HomeworkOperationCubit>().tapIndex ==
                              0
                              ? context
                              .read<MyHomeworkCubit>()
                              .deliveredHomeworks[index]
                              : context
                              .read<MyHomeworkCubit>()
                              .notDeliveredHomeworks[index]);
                    },
                  ),
                )
                    : CustomShimmer(height: 30.h, width: width);
              },
              separatorWidget: (context, index) => 20.vs,
              itemCount: state is LoadedState
                  ? (context.read<HomeworkOperationCubit>().tapIndex == 0
                  ? context.read<MyHomeworkCubit>().deliveredHomeworks.length
                  : context
                  .read<MyHomeworkCubit>()
                  .notDeliveredHomeworks
                  .length)
                  : AppConstants.shimmerItems,
            );
          }else{
            return SizedBox.shrink();
          }

        },
      );

  Widget buildHomeWorkItem(HomeworkData data) => CustomListTile(
        color: AppColors.transparent,
        title: data.title!,
        borderColor: AppColors.secondBorderColor,
        padding: getPadding(vertical: 20.h, horizontal: 15.w),
        isIcon: true,
        isDivider: false,
      );
}
