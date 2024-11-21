import 'dart:async';

import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_operation_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/submit_exam_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/widgets/exam_question/build_exam_count.dart';
import 'package:teaching/features/exam/exams/presentation/widgets/exam_question/build_exam_question.dart';
import 'package:teaching/features/exam/exams/presentation/widgets/exam_question/build_next_back_exam.dart';
import 'package:teaching/features/home_work/presentation/widgets/build_homework_question.dart';

class ExamQuestionScreen extends StatefulWidget {
  ExamQuestionScreen({super.key});
  static const String whichScreenKey = "whichScreenKey";
  @override
  State<ExamQuestionScreen> createState() => _ExamQuestionScreenState();
}

class _ExamQuestionScreenState extends State<ExamQuestionScreen> {
  late Timer _timer;
  late Duration _remainingDuration;

  @override
  void initState() {
    super.initState();
    _remainingDuration = Duration(minutes: 1);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingDuration.inSeconds > 0) {
          _remainingDuration -= const Duration(seconds: 1);
        } else {
          AppService().showCustomDialog(
            isAlert: false,
            widget: CustomElevatedButton(
                onPressed: () {
                  pop();
                  pop();
                  context.read<ExamQuestionOperationCubit>().selectedQuestion =
                      null;
                },
                text: AppStrings().done.trans),
            message: 'انتهي وقت الامتحان',
            dialogType: AlertTypes.error,
          );

          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTimeRemaining(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final int minutes = duration.inMinutes.remainder(60);
    final int seconds = duration.inSeconds.remainder(60);

    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  String? whichScreen;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      whichScreen = data![ExamQuestionScreen.whichScreenKey];
    }
    return CustomBackground(
        statusBarColor: AppColors.mainAppColor,
        child: CustomSharedFullScreen(
            isBackIcon: true,
            title: AppStrings().exam.trans,
            widget: _buildQuestionBody()));
  }

  Widget _buildQuestionBody() => Padding(
        padding: getPadding(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.vs,
            _buildTime,
            20.vs,
            whichScreen == AppStrings().exam
                ? BuildExamQuestion()
                : BuildHomeworkQuestion(),
            50.vs,
            BuildNextBackExam(
              whichScreen: whichScreen!,
            ),
            30.vs,
            BuildCount(
              whichScreen: whichScreen!,
            ),


          ],
        ),
      );

  get _buildTime => Row(
        children: [
          const CustomIcon(
            icon: Icons.timer,
            color: AppColors.mainAppColor,
          ),
          5.hs,
          CustomTextWidget(
            text: 'الوقت المتبقي : ${_formatTimeRemaining(_remainingDuration)}',
            style: getRegularTextStyle(
              fontSize: 16,
              color: AppColors.mainAppColor,
            ),
          ),
          5.hs,
        ],
      );

}
