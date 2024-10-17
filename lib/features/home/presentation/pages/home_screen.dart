import 'package:teaching/core/enums.dart';
import 'package:teaching/features/home/presentation/manager/ads_cubit.dart';
import 'package:teaching/features/home/presentation/manager/courses_cubit.dart';
import 'package:teaching/features/home/presentation/manager/school_cubit.dart';
import 'package:teaching/features/home/presentation/manager/subscription_cubit.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/home/presentation/widgets/build_ads_list.dart';
import 'package:teaching/features/home/presentation/widgets/build_choose_to_you.dart';
import 'package:teaching/features/home/presentation/widgets/build_courses.dart';
import 'package:teaching/features/home/presentation/widgets/build_categories.dart';
import 'package:teaching/features/home/presentation/widgets/build_features.dart';
import 'package:teaching/features/home/presentation/widgets/build_fields.dart';
import 'package:teaching/features/home/presentation/widgets/build_groups.dart';
import 'package:teaching/features/home/presentation/widgets/build_lecturer.dart';
import 'package:teaching/features/home/presentation/widgets/build_near_school.dart';
import 'package:teaching/features/home/presentation/widgets/build_news.dart';
import 'package:teaching/features/home/presentation/widgets/build_subscription.dart';
import 'package:teaching/features/home/presentation/widgets/build_teachers.dart';
import 'package:teaching/features/home/presentation/widgets/build_welcome_user.dart';

import '../../../../core/export/export.dart';
import '../../../main_register/presentation/widgets/build_language.dart';
import '../manager/groups_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((data) {
      context.read<CoursesCubit>().getCourser();
      context.read<AdsCubit>().getAds();
      context.read<GroupsCubit>().getGroups();
      context.read<NearSchoolCubit>().getNearSchool();
      context.read<SubscriptionCubit>().getSubscription();
      context.read<TeachersOfStudentCubit>().getTeacherOfStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView(
                children: [
                  20.vs,
                  const BuildWelcomeUser(),
                  20.vs,

                  const BuildCategories(),
                  const BuildAdsList(),

                  // // 5.vs,
                  30.vs,

                  // const BuildFields(), 20.vs,
                  // _buildTitle(
                  //   text: AppStrings().choseForYou.trans,
                  // ),
                  // 8.vs,
                  // const BuildChooseToYou(), 20.vs,
                  // _buildTitle(text: AppStrings().lecturers.trans),
                  // 8.vs,
                  // const BuildLecturer(),
                  if (AppPrefs.user!.userRole == '1' ||
                      AppPrefs.user!.userRole == '2')
                    _buildTitle(
                        text: AppStrings().closeSchools.trans,
                        asset: AppAssets().schoolIcon),
                  if (AppPrefs.user!.userRole == '1') 5.vs,
                  if (AppPrefs.user!.userRole == '1') const BuildNearSchool(),
                  if (AppPrefs.user!.userRole == '1') 20.vs,
                  if (AppPrefs.user!.userRole == '1')
                    _buildTitle(
                        text: AppStrings().latestNews.trans,
                        asset: AppAssets().newsIcon),
                  if (AppPrefs.user!.userRole == '1') const BuildNews(),
                  20.vs,
                  _buildTitle(
                      onTap: () => Routes.publicCoursesGroupsRoute.moveTo,
                      all: AppStrings().all.trans,
                      text: AppStrings().courses.trans,
                      asset: AppAssets().coursesIcon),
                  5.vs,
                  const BuildCourses(),
                  20.vs,
                  _buildTitle(
                      onTap: () => Routes.publicCoursesGroupsRoute.moveTo,
                      all: AppStrings().all.trans,
                      text: AppStrings().groups.trans,
                      asset: AppAssets().groupsIcon),
                  5.vs,
                  const BuildGroups(),
                  if (AppPrefs.user!.userRole == '1') 20.vs,
                  if (AppPrefs.user!.userRole == '1')
                    _buildTitle(
                        onTap: () => Routes.teachersRoute.moveTo,
                        all: AppStrings().all.trans,
                        text: AppStrings().teachers.trans,
                        asset: AppAssets().teacherIcon),
                  if (AppPrefs.user!.userRole == '1') 5.vs,
                  if (AppPrefs.user!.userRole == '1') const BuildTeachers(),
                  if (AppPrefs.user!.userRole == '1') 20.vs,
                  if (AppPrefs.user!.userRole == '1')
                    _buildTitle(text: AppStrings().mySubscriptions.trans),
                  if (AppPrefs.user!.userRole == '1') 5.vs,
                  if (AppPrefs.user!.userRole == '1') const BuildSubscription(),
                  20.vs,
                  if (AppPrefs.user!.userRole == '2')
                    _buildTitle(
                        text: AppStrings().features.trans,
                        asset: AppAssets().featuresIcon),
                  10.vs,
                  if (AppPrefs.user!.userRole == '2')
                    const SizedBox(child: BuildFeatures()),
                  20.vs
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTitle(
          {required String text,
          Function? onTap,
          String? asset,
          String? all}) =>
      Padding(
        padding: getPadding(start: 20.w),
        child: Row(
          children: [
            CustomTextWidget(
              text: text,
              style: getSemiboldTextStyle(
                  fontSize: 18, fontFamily: FontFamilies.elMessiriFamily),
            ),
            if (asset.isNotNull) 5.hs,
            if (asset.isNotNull)
              CustomImageWidget(
                asset: asset!,
                width: 20.w,
                height: 20.h,
              ),
            if (all.isNotNull) const Spacer(),
            if (all.isNotNull)
              GestureDetector(
                onTap: () => onTap!(),
                child: Padding(
                  padding: getPadding(end: 20.w),
                  child: Row(
                    children: [
                      CustomTextWidget(
                        text: all!,
                        style: getSemiboldTextStyle(
                            fontSize: 14,
                            fontFamily: FontFamilies.elMessiriFamily),
                      ),
                      2.hs,
                      const CustomIcon(
                        icon: Icons.arrow_forward_ios,
                        size: 12,
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      );

  Widget _buildAppBar(context) => Padding(
        padding: getPadding(horizontal: 20.w, top: 15.h, bottom: 10.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const CustomIcon(
                icon: Icons.menu,
                color: AppColors.mainAppColor,
              ),
            ),
            // 10.hs,
            // const CustomIcon(
            //   icon: Icons.light_mode_rounded,
            //   color: AppColors.mainAppColor,
            // ),
            const Spacer(),
            // const BuildLanguage(),
            const CustomIcon(
              icon: Icons.search,
              color: AppColors.mainAppColor,
            ),
          ],
        ),
      );
}
