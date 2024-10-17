import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/exam_operation_cubit.dart';
import 'package:teaching/features/exam/presentation/manager/exam_cubit.dart';
import 'package:teaching/features/exam/presentation/widgets/build_exam_item.dart';

class BuildExamWidget extends StatelessWidget {
  const BuildExamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamOperationCubit, CubitStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTabBar(
              fontSize: 14,
              onTap: (index) =>
                  context.read<ExamOperationCubit>().onChangeTabIndex(index),
              text: AppListsConstant.exams,
              selectedIndex: context.read<ExamOperationCubit>().examTapIndex,
            ),
            Expanded(
              child: context.read<ExamOperationCubit>().examTapIndex == 0
                  ? buildPassedExams()
                  : buildPassedExams(isPassed: true),
            )
          ],
        );
      },
    );
  }

  Widget buildPassedExams({bool isPassed = false}) =>
      BlocBuilder<ExamCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(message: state.message, onTap: () {});
          }
          if (state is LoadedState &&
              (context.read<ExamOperationCubit>().examTapIndex == 0
                  ? state.data.passedExams.isEmpty
                  : state.data.notPassedExam.isEmpty)) {
            return CustomEmptyWidget();
          }
          return CustomListView(
              axisDirection: Axis.vertical,
              separatorWidget: (context, index) => 20.vs,
              shrinkWrap: true,
              itemCount: state is LoadedState
                  ? context.read<ExamOperationCubit>().examTapIndex == 0
                      ? state.data.passedExams.lenght
                      : state.data.notPassedExam.lenght
                  : AppConstants.shimmerItems,
              widget: (context, index) => state is LoadedState
                  ? BuildExamItem(
                      passedExam: state.data.passedExams[index],
                      notPassedExam: state.data.notPassedExam[index],
                    )
                  : CustomShimmer());
        },
      );
}
