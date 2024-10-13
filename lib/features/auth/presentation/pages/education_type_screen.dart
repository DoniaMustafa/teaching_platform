import 'package:teaching/features/auth/presentation/manager/education/education_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/subject/subject_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/auth/presentation/pages/sign_up_py_phone_screen.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_curriculum.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_stage.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_subject.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_types.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_qualification_education_type.dart';

import '../../../../core/export/export.dart';

class EducationTypeScreen extends StatefulWidget {
  EducationTypeScreen({super.key});

  @override
  State<EducationTypeScreen> createState() => _EducationTypeScreenState();
}

class _EducationTypeScreenState extends State<EducationTypeScreen>
    with SignUpByPhoneVariables, QualificationEducationVariables {
  @override
  Widget build(BuildContext context) {
    return BuildBackgroundWithAppBar(
      userType: SignUpByPhoneScreen.userType,
      child: Padding(
        padding: getPadding(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            3.vs,

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomImageWidget(
                      asset: AppAssets().students,
                      width: 170.w,
                      height: 190.h,
                    ),
                    20.vs,
                    if (SignUpByPhoneScreen.userType == AppStrings().student)
                      _buildStudentEducation,
                    if (SignUpByPhoneScreen.userType == AppStrings().teacher)
                      _buildTeacherEducation,
                    200.vs,
                    _buildContinuaButton,
                    40.vs,
                  ],
                ),
              ),
            ),
            // // if (SignUpScreen.SignUpByPhoneScreen.userType == 'teacher') 48.vs,

            // if (SignUpByPhoneScreen.userType == AppStrings().assistant)
            //   _buildAssistantEducation,
            // const Spacer(),
          ],
        ),
      ),
    );
  }

  get _buildStudentEducation => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: BlocBuilder<EducationCubit, EducationState>(
                builder: (context, state) {
                  return BuildEducationMaterial();
                },
              )),
              Expanded(
                child: BlocBuilder<ProgramCubit, ProgramState>(
                    builder: (context, state) {
                  if (context.read<ProgramCubit>().isEducationTypeDone.isTrue) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (context
                            .read<ProgramCubit>()
                            .isEducationTypeDone
                            .isTrue)
                          10.hs,
                        if (context
                            .read<ProgramCubit>()
                            .isEducationTypeDone
                            .isTrue)
                          Expanded(child: BuildEducationCurriculum()),
                      ],
                    );
                  }
                  return SizedBox.shrink();
                }),
              )
            ],
          ),
          20.vs,
          BlocBuilder<StageCubit, StageState>(builder: (context, state) {
            if (AppService().getBlocData<StageCubit>().isProgramDone.isTrue) {
              return BuildEducationStage();
            }
            return SizedBox.shrink();
          }),
        ],
      );
  get _buildTeacherEducation => BlocBuilder<ProgramCubit, ProgramState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: BuildEducationMaterial()),
                  if (context.read<ProgramCubit>().isEducationTypeDone.isTrue)
                    10.hs,
                  if (context.read<ProgramCubit>().isEducationTypeDone.isTrue)
                    Expanded(child: BuildEducationCurriculum()),
                ],
              ),
              20.vs,
              BlocBuilder<SubjectCubit, SubjectState>(
                builder: (context, state) {
                  return BlocBuilder<StageCubit, StageState>(
                    builder: (context, state) {
                      print(context.read<SubjectCubit>().isSubjectsDone);
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (context.read<StageCubit>().isProgramDone.isTrue)
                            Expanded(child: BuildEducationStage()),
                          10.hs,
                          if (context
                              .read<SubjectCubit>()
                              .isSubjectsDone
                              .isTrue)
                            Expanded(child: BuildEducationSubject()),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      );

  get _buildAssistantEducation => Column(
        children: [
          BuildQualificationEducationType(),
          20.vs,
          if (selected == 1 && selected.isNotNull) BuildEducationStage(),
          // 20.vs,
          // BuildEducationCurriculum(),
          // 20.vs,
          // BuildEducationMaterial(),
          // 100.vs,
        ],
      );

  get _buildContinuaButton => Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: BuildNextButton(
        onTap: () {
          // if (SignUpByPhoneScreen.userType == AppStrings().student) {
          AppService().getBlocData<UserCubit>().register(
              education: PostParamsEducationModel(
                  phoneNumber: VerificationScreen.phone,
                  educationTypeIds: [context.read<EducationCubit>().typeId!],
                  programTypeIds: [context.read<ProgramCubit>().curriculumId!],
                  gradeIds: [context.read<StageCubit>().gradeId!],
                  subjectIds:
                      SignUpByPhoneScreen.userType == AppStrings().student
                          ? null
                          : [context.read<SubjectCubit>().subjectsId!]),
              stepsNo: 3);
          // }
          // if (SignUpByPhoneScreen.userType == AppStrings().teacher) {
          //   AppService().getBlocData<UserCubit>().register(
          //       education: PostParamsEducationModel(
          //         phoneNumber: VerificationScreen.phone,
          //         educationTypeId: context.read<EducationCubit>().typeId,
          //         programTypeId: context.read<ProgramCubit>().curriculumId,
          //         gradeIds: context.read<StageCubit>().gradeId,
          //       ),
          //       stepsNo: 3);
          // }
        },
        text: SignUpByPhoneScreen.userType == AppStrings().student
            ? AppStrings().createAccount.trans
            : AppStrings().continuation.trans,
      ));
}
