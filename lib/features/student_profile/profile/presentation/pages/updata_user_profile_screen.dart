import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/manager/countries/city_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/countries/region_cubit.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_country/build_sign_city.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_country/build_sign_country.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_stage.dart';
import 'package:teaching/features/auth/presentation/widgets/sign_up/build_education_drop_down/build_education_subject.dart';

import '../../../../auth/presentation/widgets/sign_up/build_country/build_sign_region.dart';
import '../../../../auth/presentation/widgets/sign_up/build_education_drop_down/build_education_curriculum.dart';
import '../../../../auth/presentation/widgets/sign_up/build_education_drop_down/build_education_types.dart';

mixin UpdateUserInputProfileData {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController national = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController eduType = TextEditingController();
  TextEditingController gradeType = TextEditingController();
  TextEditingController schoolName = TextEditingController();
}

class UpdateUserProfileScreen extends StatefulWidget {
  const UpdateUserProfileScreen({super.key});

  @override
  State<UpdateUserProfileScreen> createState() =>
      _UpdateUserProfileScreenState();
}

class _UpdateUserProfileScreenState extends State<UpdateUserProfileScreen>
    with UpdateUserInputProfileData {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = AppPrefs.user!.name!;
    email.text = AppPrefs.user!.email ?? '@gmail.com';
    email.text = AppPrefs.user!.email ?? '@gmail.com';
    phone.text = AppPrefs.user!.phoneNumber ?? '00000000000';
    national.text = AppPrefs.user!.nationalId ?? '00000000000000';
    context.read<CountriesCubit>().getCountries();
  }

  @override
  void didUpdateWidget(covariant UpdateUserProfileScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    name.text = AppPrefs.user!.name!;
    email.text = AppPrefs.user!.email ?? '@gmail.com';
    email.text = AppPrefs.user!.email ?? '@gmail.com';
    phone.text = AppPrefs.user!.phoneNumber ?? '00000000000';
    national.text = AppPrefs.user!.nationalId ?? '00000000000000';
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: true,
      showBack: true, showTitle: true, showAppbar: true,
      widget: CustomTextWidget(
        align: TextAlign.center,
        text: AppStrings().profile.trans,
        style: getBoldTextStyle(fontSize: 18),
      ),
      // backgroundColor: AppColors.white,
      statusBarColor: AppColors.mainAppColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: getPadding(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 20.vs,

              // 10.vs,
              // Align(
              //   alignment: AlignmentDirectional.center,
              //   child: Stack(
              //     alignment: AlignmentDirectional.bottomEnd,
              //     children: [
              //       CustomNetworkImage.circular(
              //         imageUrl:
              //             '${EndPoints.url}${AppPrefs.user!.profilePicture}',
              //         radius: 80.r,
              //       ),
              //       CustomCircleWidget(
              //         radius: 25.r,
              //         alignment: AlignmentDirectional.center,
              //         width: 25.w,
              //         height: 25.h,
              //         padding: getPadding(all: 0),
              //         color: AppColors.white,
              //         child: const CustomIcon(
              //           size: 15,
              //           icon: Icons.camera_alt,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // 10.vs,
              // CustomTextWidget(
              //   text: AppPrefs.user!.name!,
              //   style: getBoldTextStyle(fontSize: 20),
              // ),
              30.vs,
              buildProfileInput(
                  title: AppStrings().userNameHint.trans,
                  input: name,
                  icon: Icons.person),
              20.vs,
              buildProfileInput(
                  title: AppStrings().phone.trans,
                  input: phone,
                  icon: Icons.phone_android),
              20.vs,
              buildProfileInput(
                  title: AppStrings().emailHint.trans,
                  input: email,
                  icon: Icons.email),
              20.vs,
              // Row(
              //
              //   children: List.generate(3, (index)=> Expanded(child: buildProfileInput(
              //       title: AppStrings().emailHint.trans,
              //       input: email,
              //       icon: Icons.email)),),
              // ),
              buildProfileInput(
                  title: 'الرقم القومي', input: national, icon: Icons.person),
              if (AppPrefs.userRole == "1")   20.vs,
              if (AppPrefs.userRole == "1") _buildTeacherEducation,
              if (AppPrefs.userRole == "1") 10.vs,
              // buildProfileInput(
              //   title: 'نوع التعليم',
              //   input: eduType,
              // ),
              // 20.vs,
              // buildProfileInput(
              //   title: 'السنه الدراسية',
              //   input: gradeType,
              // ),
              // 20.vs,
              if (AppPrefs.userRole == "1")
                buildProfileInput(
                  title: 'اسم المدرسة',
                  input: schoolName,
                ),
             20.vs,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: BuildSignCountry(
                    isProfile: true,
                  )),
                  5.hs,
                  Expanded(child: BuildSignCity()),
                  5.hs,
                ],
              ),
              20.vs,

              BlocBuilder<RegionCubit, CubitStates>(
                builder: (context, state) {
                  return context.read<RegionCubit>().region.isNotEmpty &&
                          context.read<RegionCubit>().isGetCitiesDone.isTrue
                      ? BuildSignRegion()
                      : const SizedBox.shrink();
                },
              ),
              100.vs,
              CustomElevatedButton(
                onPressed: () {
                  context.read<UserCubit>().editUserData(
                      user: UpdateProfileParamsModel(
                          name: name.text,
                          phoneNumber: phone.text,
                          email: email.text,
                          gradeId: context.read<StageCubit>().gradeId,
                          educationTypeId:
                              context.read<EducationCubit>().typeId,
                          nationalId: national.text,
                          programTypeId:
                              context.read<ProgramCubit>().curriculumId,
                          stateId: BuildSignRegion.selectedRegionId,
                          schoolName: schoolName.text));
                },
                text: AppStrings().editAccount.trans,
                margin: getMargin(horizontal: 50.w),
              ),
              50.vs,

              10.vs,
            ],
          ),
        ),
      ),
    );
  }

  buildProfileInput(
          {required String title,
          IconData? icon,
          required TextEditingController input}) =>
      CustomTextFormField(
        label: title,
        controller: input,
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
                  Expanded(
                      child: BuildEducationMaterial(
                    isProfile: true,
                    eduId: AppPrefs.user!.educationTypeId!,
                  )),
                  if (context.read<ProgramCubit>().isEducationTypeDone.isTrue)
                    10.hs,
                  if (context.read<ProgramCubit>().isEducationTypeDone.isTrue &&
                      context
                          .read<ProgramCubit>()
                          .educationProgramsData
                          .isNotEmpty)
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
                          if (context.read<StageCubit>().isProgramDone.isTrue &&
                              context.read<StageCubit>().stageData.isNotEmpty)
                            Expanded(child: BuildEducationStage()),
                          if (SignUpByPhoneScreen.userType ==
                              AppStrings().teacher)
                            10.hs,
                          if (SignUpByPhoneScreen.userType ==
                                  AppStrings().teacher &&
                              context
                                  .read<SubjectCubit>()
                                  .isSubjectsDone
                                  .isTrue &&
                              context
                                  .read<SubjectCubit>()
                                  .subjectData
                                  .isNotEmpty)
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
}
