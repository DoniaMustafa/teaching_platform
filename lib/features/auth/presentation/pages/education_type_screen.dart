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
    with QualificationEducationVariables {
  @override
  Widget build(BuildContext context) {
    return BuildBackgroundWithAppBar(
      userType: SignUpByPhoneScreen.userType,
      child: Padding(
        padding: getPadding(horizontal: 20.w),
        child: Column(
          children: [
            3.vs,
            CustomImageWidget(
              asset: AppAssets().students,
              width: 170.w,
              height: 190.h,
            ),
            20.vs,
            if (SignUpByPhoneScreen.userType == AppStrings().student)
              _buildStudentEducation,
            // // if (SignUpScreen.userType == 'teacher') 48.vs,
            if (SignUpByPhoneScreen.userType == AppStrings().teacher)
              _buildTeacherEducation,
            if (SignUpByPhoneScreen.userType == AppStrings().assistant)
              _buildAssistantEducation,
            const Spacer(),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: BuildNextButton(
                  onTap: () {
                    if (SignUpByPhoneScreen.userType == AppStrings().student) {
                      showCreateAccountDialog(context);
                    }
                    if (SignUpByPhoneScreen.userType == AppStrings().teacher) {
                      Routes.uploadResumeRoute.moveTo;
                    }
                  },
                  text: SignUpByPhoneScreen.userType == AppStrings().student
                      ? AppStrings().createAccount.trans
                      : AppStrings().continuation.trans,
                )),
            40.vs,
          ],
        ),
      ),
    );
  }

  get _buildStudentEducation => Column(
        children: [
          BuildEducationMaterial(),
          20.vs,
          BuildEducationCurriculum(),
          20.vs,
          BuildEducationStage(),
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
