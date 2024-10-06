import 'package:teaching/features/auth/presentation/manager/education/education_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_curriculum.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_stage.dart';
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
      userType: AppStrings().student,
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
                    200.vs,
                    Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: BuildNextButton(
                          onTap: () {
                            if (SignUpByPhoneScreen.userType ==
                                AppStrings().student) {
                              AppService().getBlocData<UserCubit>().register(
                                  user: UserModel(
                                    phoneNumber: VerificationScreen.phone,
                                    educationTypeId:
                                        context.read<EducationCubit>().typeId,
                                    programTypeId: context
                                        .read<ProgramCubit>()
                                        .curriculumId,
                                    gradeIds:
                                        context.read<StageCubit>().gradeId,
                                  ),
                                  stepsNo: 3);
                            }
                            if (SignUpByPhoneScreen.userType ==
                                AppStrings().teacher) {
                              Routes.uploadResumeRoute.moveTo;
                            }
                          },
                          text: SignUpByPhoneScreen.userType ==
                                  AppStrings().student
                              ? AppStrings().createAccount.trans
                              : AppStrings().continuation.trans,
                        )),
                    40.vs,
                  ],
                ),
              ),
            )
            // // // if (SignUpScreen.SignUpByPhoneScreen.userType == 'teacher') 48.vs,
            // if (SignUpByPhoneScreen.userType == AppStrings().teacher)
            //   _buildTeacherEducation,
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
            if (AppService()
                .getBlocData<StageCubit>()
                .isProgramDone
                .isTrue) {
              return BuildEducationStage();
            }
            return SizedBox.shrink();
          }),
        ],
      );
  get _buildTeacherEducation => Column(
        children: [
          Row(
            children: [
              Expanded(child: BuildEducationMaterial()),
              10.hs,
              Expanded(child: BuildEducationCurriculum()),
            ],
          ),
          15.vs,
          Row(
            children: [
              Expanded(child: BuildEducationStage()),
              10.hs,
              Expanded(child: BuildEducationCurriculum()),
            ],
          ),
        ],
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
}
