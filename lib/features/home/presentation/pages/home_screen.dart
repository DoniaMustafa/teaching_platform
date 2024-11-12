import 'package:teaching/features/chat/presentation/manager/chat_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/teacher_to_chat_cubit.dart';
import 'package:teaching/features/home/presentation/widgets/build_ads_list.dart';
import 'package:teaching/features/home/presentation/widgets/build_courses.dart';
import 'package:teaching/features/home/presentation/widgets/build_categories.dart';
import 'package:teaching/features/home/presentation/widgets/build_features.dart';
import 'package:teaching/features/home/presentation/widgets/build_groups.dart';
import 'package:teaching/features/home/presentation/widgets/build_near_school.dart';
import 'package:teaching/features/home/presentation/widgets/build_news.dart';
import 'package:teaching/features/home/presentation/widgets/build_teachers.dart';
import 'package:teaching/features/home/presentation/widgets/build_title_Item.dart';
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
      if (AppPrefs.userRole == '1') {
        context.read<PublicCourseCubit>().getPublicCourses();
      }

      if (AppPrefs.userRole == '1') {
        context.read<PublicGroupCubit>().getPublicGroups();
      }

      context.read<NearSchoolCubit>().getNearSchool();
      context.read<TeacherToChatCubit>().getTeacherToChat();

      context.read<ChatCubit>().getSingleChats();

      // context.read<SubscriptionCubit>().ChatCubit(isModel: true);
      if (AppPrefs.userRole == '1') {
        context.read<TeachersOfStudentCubit>().getTeacherOfStudent();
      }
      context.read<NotificationCubit>().getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('AppPrefs.userRole>>>>>>>>>>>>>>>> ${AppPrefs.userRole}');
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
                  /////////////////////////////// NearSchool //////////////////////////////////

                  // if (AppPrefs.userRole == '1' || AppPrefs.userRole == '2')
                  BuildTitleItem(
                    text: AppStrings().closeSchools.trans,
                  ),
                  // if (AppPrefs.userRole == '1')
                  5.vs,
                  // if (AppPrefs.userRole == '1')
                  const BuildNearSchool(),
                  if (AppPrefs.userRole == '1') 20.vs,
                  /////////////////////////////// News //////////////////////////////////

                  if (AppPrefs.userRole == '1')
                    BuildTitleItem(
                      text: AppStrings().latestNews.trans,
                    ),
                  if (AppPrefs.userRole == '1') const BuildNews(),
                  if (AppPrefs.userRole == '1') 20.vs,
                  /////////////////////////////// courses //////////////////////////////////

                  if (AppPrefs.userRole == '1')
                    BuildTitleItem(
                      onTap: () {
                        Routes.publicCoursesGroupsRoute.moveTo;
                        context
                            .read<CoursesGroupOperationCubit>()
                            .onChangePublicTabIndex(0);
                      },
                      all: AppStrings().all.trans,
                      text: AppStrings().courses.trans,
                    ),
                  if (AppPrefs.userRole == '1') 5.vs,
                  if (AppPrefs.userRole == '1') const BuildCourses(),
                  if (AppPrefs.userRole == '1') 20.vs,
                  /////////////////////////////// groups //////////////////////////////////

                  if (AppPrefs.userRole == '1')
                    BuildTitleItem(
                      onTap: () {
                        Routes.publicCoursesGroupsRoute.moveTo;
                        context
                            .read<CoursesGroupOperationCubit>()
                            .onChangePublicTabIndex(1);
                      },
                      all: AppStrings().all.trans,
                      text: AppStrings().groups.trans,
                    ),
                  if (AppPrefs.userRole == '1') 5.vs,
                  if (AppPrefs.userRole == '1') const BuildGroups(),
                  if (AppPrefs.userRole == '1') 20.vs,
                  if (AppPrefs.userRole == '1')
                    /////////////////////////////// Teachers //////////////////////////////////
                    BuildTitleItem(
                      onTap: () => Routes.teachersRoute.moveTo,
                      all: AppStrings().all.trans,
                      text: AppStrings().teachers.trans,
                    ),
                  if (AppPrefs.userRole == '1') 5.vs,
                  if (AppPrefs.userRole == '1') const BuildTeachers(),
                  /////////////////////////////// Subscription //////////////////////////////////
                  // if (AppPrefs.userRole == '1') 20.vs,
                  // if (AppPrefs.userRole == '1')
                  //   BuildTitleItem(
                  //     all: AppStrings().all.trans,
                  //     text: AppStrings().mySubscriptions.trans,
                  //     onTap: () {
                  //       context
                  //           .read<BottomNavBarOperationCubit>()
                  //           .onSelectedItem(2);
                  //     },
                  //   ),
                  // if (AppPrefs.userRole == '1') 5.vs,
                  // if (AppPrefs.userRole == '1') const BuildSubscription(),

                  /////////////////////////////// features //////////////////////////////////
                  20.vs,
                  if (AppPrefs.userRole == '2')
                    BuildTitleItem(
                      text: AppStrings().features.trans,
                    ),
                  10.vs,
                  if (AppPrefs.userRole == '3')
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
