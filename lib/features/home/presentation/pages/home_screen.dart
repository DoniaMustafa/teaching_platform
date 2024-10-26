import 'package:teaching/core/enums.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_course_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_group_cubit.dart';
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
import 'package:teaching/features/home/presentation/widgets/build_title_Item.dart';
import 'package:teaching/features/home/presentation/widgets/build_welcome_user.dart';
import 'package:teaching/features/notification/presentation/manager/notification_cubit.dart';

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
      context.read<AdsCubit>().getAds();
      context.read<PublicCourseCubit>().getPublicCourses();
      context.read<PublicGroupCubit>().getPublicGroups();
      context.read<NearSchoolCubit>().getNearSchool();
      context.read<SubscriptionCubit>().getSubscription(isModel: true);
      context.read<TeachersOfStudentCubit>().getTeacherOfStudent();
      context.read<NotificationCubit>().getNotification();
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
                  BuildWelcomeUser(),
                  20.vs,

                  BuildCategories(),
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
                  /////////////////////////////// NearSchool //////////////////////////////////

                  if (AppPrefs.user!.userRole == '1' ||
                      AppPrefs.user!.userRole == '2')
                    BuildTitleItem(
                        text: AppStrings().closeSchools.trans,
                        asset: AppAssets().schoolIcon),
                  if (AppPrefs.user!.userRole == '1') 5.vs,
                  if (AppPrefs.user!.userRole == '1') const BuildNearSchool(),
                  if (AppPrefs.user!.userRole == '1') 20.vs,
                  /////////////////////////////// News //////////////////////////////////

                  if (AppPrefs.user!.userRole == '1')
                    BuildTitleItem(
                        text: AppStrings().latestNews.trans,
                        asset: AppAssets().newsIcon),
                  if (AppPrefs.user!.userRole == '1') const BuildNews(),
                  20.vs,
                  /////////////////////////////// courses //////////////////////////////////

                  BuildTitleItem(
                      onTap: () {
                        Routes.publicCoursesGroupsRoute.moveTo;
                        context
                            .read<CoursesGroupOperationCubit>()
                            .onChangePublicTabIndex(0);
                      },
                      all: AppStrings().all.trans,
                      text: AppStrings().courses.trans,
                      asset: AppAssets().coursesIcon),
                  5.vs,
                  const BuildCourses(),
                  20.vs,
                  /////////////////////////////// groups //////////////////////////////////

                  BuildTitleItem(
                      onTap: () {
                        Routes.publicCoursesGroupsRoute.moveTo;
                        context
                            .read<CoursesGroupOperationCubit>()
                            .onChangePublicTabIndex(1);
                      },
                      all: AppStrings().all.trans,
                      text: AppStrings().groups.trans,
                      asset: AppAssets().groupsIcon),
                  5.vs,
                  const BuildGroups(),
                  if (AppPrefs.user!.userRole == '1') 20.vs,
                  if (AppPrefs.user!.userRole == '1')
                    /////////////////////////////// Teachers //////////////////////////////////
                    BuildTitleItem(
                        onTap: () => Routes.teachersRoute.moveTo,
                        all: AppStrings().all.trans,
                        text: AppStrings().teachers.trans,
                        asset: AppAssets().teacherIcon),
                  if (AppPrefs.user!.userRole == '1') 5.vs,
                  if (AppPrefs.user!.userRole == '1') const BuildTeachers(),
                  /////////////////////////////// Subscription //////////////////////////////////
                  if (AppPrefs.user!.userRole == '1') 20.vs,
                  if (AppPrefs.user!.userRole == '1')
                    BuildTitleItem(
                      all: AppStrings().all.trans,
                      text: AppStrings().mySubscriptions.trans,
                      onTap: () {
                        context
                            .read<BottomNavBarOperationCubit>()
                            .onSelectedItem(2);
                      },
                    ),
                  if (AppPrefs.user!.userRole == '1') 5.vs,
                  if (AppPrefs.user!.userRole == '1') const BuildSubscription(),
                  20.vs,
                  /////////////////////////////// features //////////////////////////////////

                  if (AppPrefs.user!.userRole == '2')
                    BuildTitleItem(
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
            const Spacer(),
            const CustomIcon(
              icon: Icons.search,
              color: AppColors.mainAppColor,
            ),
          ],
        ),
      );
}
