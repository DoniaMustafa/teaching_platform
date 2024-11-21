import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_operation_cubit.dart';

class BuildExamQuestion extends StatefulWidget {
  BuildExamQuestion({
    super.key,
  });
  static PageController controller = PageController();

  @override
  State<BuildExamQuestion> createState() => _BuildExamQuestionState();
}

class _BuildExamQuestionState extends State<BuildExamQuestion> {
  List<Question>? answer = [];
  Choice? choice;
  List<Choice>? choices = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExamQuestionCubit, CubitStates>(builder: (context, state) {
        if (state is FailedState) {
          return CustomErrorWidget(
            onTap: () {},
            message: state.message,
          );
        }
        if (state is LoadedState) {
          return _buildPageView(state.data);
        }
        return Column(
          children: [
            40.vs,
            CustomShimmer(
              width: 100.w,
              height: 50.h,
            )
          ],
        );
      }),
    );
  }

  Widget _buildPageView(ExamQuestionsData data) => PageView.builder(
      controller: BuildExamQuestion.controller,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.questions!.length,
      onPageChanged: (int index) =>
          context.read<ExamQuestionOperationCubit>().onChangePage(index: index),
      itemBuilder: (context, questionsIndex) =>
          _buildQuestion(data.questions![questionsIndex], questionsIndex));

  Widget _buildQuestion(Question questions, int questionsIndex) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomCard(
            borderColor: AppColors.borderColor2,
            borderWidth: 1,
            backgroundColor: AppColors.transparent,
            radius: 10.r,
            padding: getPadding(vertical: 20, horizontal: 20.w),
            child: CustomTextWidget(
              text: questions.text!,
              style: getRegularTextStyle(
                fontSize: 16,
                color: AppColors.black.withOpacity(0.75),
              ),
            ),
          ),
          30.vs,
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              questions.choices!.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<ExamQuestionOperationCubit>()
                        .selectedQuestion = index;
                    AppService().getBlocData<ExamQuestionCubit>().choices[index] =
                        questions.choices![index];

                    AppService()
                        .getBlocData<ExamQuestionOperationCubit>()
                        .answers[questionsIndex]
                        .answer = questions.choices![index].choiceText!;

                    setState(() {});
                  },
                  child: CustomCard(
                    borderColor: AppColors.borderColor2,
                    borderWidth: 1,
                    radius: 10.r,
                    backgroundColor: context
                                .read<ExamQuestionOperationCubit>()
                                .selectedQuestion ==
                            index
                        ? AppColors.mainAppColor
                        : AppColors.white,
                    alignment: AlignmentDirectional.center,
                    margin: getPadding(vertical: 5.h),
                    padding: getPadding(vertical: 10.h, horizontal: 20.w),
                    child: CustomTextWidget(
                      text: questions.choices![index].choiceText!,
                      style: getSemiboldTextStyle(
                        fontSize: 16,
                        color: context
                                    .read<ExamQuestionOperationCubit>()
                                    .selectedQuestion ==
                                index
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
}
