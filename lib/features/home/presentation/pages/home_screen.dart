import 'package:teaching/core/enums.dart';
import 'package:teaching/features/home/presentation/manager/ads_cubit.dart';
import 'package:teaching/features/home/presentation/manager/courses_groups_cubit.dart';
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
      context.read<CoursesGroupsCubit>().getCourserAndGroups();
      context.read<NearSchoolCubit>().getNearSchool();
      context.read<SubscriptionCubit>().getSubscription();

      context.read<TeachersOfStudentCubit>().getTeacherOfStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              _buildTitle(
                  text: AppStrings().closeSchools.trans,
                  asset: AppAssets().schoolIcon),
              5.vs,
              BuildNearSchool(),
              20.vs,
              _buildTitle(
                  text: AppStrings().latestNews.trans,
                  asset: AppAssets().newsIcon),
              // BuildNews(),
              // 20.vs,
              _buildTitle(
                  text: AppStrings().course.trans,
                  asset: AppAssets().coursesIcon),
              // 5.vs,
              BuildCourses(),
              // 20.vs,
              _buildTitle(
                  text: AppStrings().groups.trans,
                  asset: AppAssets().groupsIcon),
              // 5.vs,
              BuildGroups(),
              // 20.vs,
              _buildTitle(
                  text: AppStrings().teachers.trans,
                  asset: AppAssets().teacherIcon),
              // 5.vs,
              BuildTeachers(),
              // 20.vs,
              _buildTitle(text: AppStrings().mySubscriptions.trans),
              // 5.vs,
              BuildSubscription(),
              // 20.vs,
              _buildTitle(
                  text: AppStrings().features.trans,
                  asset: AppAssets().featuresIcon),
              5.vs,

              BuildFeatures(),
              // 20.vs
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle({required String text, String? asset}) => Padding(
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
              )
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
            10.hs,
            const CustomIcon(
              icon: Icons.light_mode_rounded,
              color: AppColors.mainAppColor,
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
