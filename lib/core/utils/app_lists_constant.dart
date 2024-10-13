import 'package:flutter/cupertino.dart';
import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/model/generic_model.dart';
import 'package:teaching/core/utils/app_assets.dart';
import 'package:teaching/core/utils/app_strings.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/chat/presentation/pages/chat_screen.dart';
import 'package:teaching/features/home/presentation/pages/home_screen.dart';
import 'package:teaching/features/notification/presentation/pages/notification_screen.dart';
import 'package:teaching/features/on_boarding/presentation/widgets/build_first_widget.dart';
import 'package:teaching/features/on_boarding/presentation/widgets/build_inductor_widget.dart';
import 'package:teaching/features/schedule/presentation/pages/schedule_screen.dart';
import 'package:teaching/features/subscription/presentation/pages/subscription_screen.dart';
import 'package:teaching/features/wallet/presentation/pages/wallet_screen.dart';

class AppListsConstant {
  static List<GenericModel> roles = [
    GenericModel(
      id: 1,
      image: AppAssets().student,
      role: AppStrings().student,
      title: AppStrings().student.trans,
    ),
    GenericModel(
      id: 2,
      image: AppAssets().teacher,
      role: AppStrings().teacher,
      title: AppStrings().teacher.trans,
    ),
    GenericModel(
      id: 3,
      image: AppAssets().parent,
      title: AppStrings().parent.trans,
      role: AppStrings().parent,
    ),
    GenericModel(
      id: 7,
      image: AppAssets().professionalCourses,
      role: AppStrings().professionalCourses,
      title: AppStrings().professionalCourse.trans,
    ),
    GenericModel(
      id: 5,
      image: AppAssets().school,
      role: AppStrings().school,
      title: AppStrings().school.trans,
    ),
    GenericModel(
      id: 6,
      image: AppAssets().assistant,
      role: AppStrings().assistant,
      title: AppStrings().assistant.trans,
    ),
  ];
  static List promo = [
    AppStrings().video.trans,
    AppStrings().url.trans,
  ];
  static List<String> subscribeTab = [
    AppStrings().courses.trans,
    AppStrings().groups.trans,
  ];
  static List<String> chatting = [
    AppStrings().chat.trans,
    AppStrings().groups.trans,
  ];

  static List<GenericModel> onBoardingBody = [
    GenericModel(
      image: AppAssets().videoOnboarding,
      title: AppStrings().onBoardingTitle1.trans,
      subTitle: AppStrings().onBoardingSubTitle1.trans,
    ),
    GenericModel(
      image: AppAssets().videoOnboarding,
      title: AppStrings().onBoardingTitle2.trans,
      subTitle: AppStrings().onBoardingSubTitle2.trans,
    ),
  ];

  static List<GenericModel> coursesRole = [
    GenericModel(
      id: 1,
      image: AppAssets().student,
      role: AppStrings().student,
      title: AppStrings().student.trans,
    ),
    GenericModel(
      id: 8,
      image: AppAssets().teacher,
      role: AppStrings().professionalLecturer,
      title: AppStrings().lecture.trans,
    ),
  ];

  static List<Widget> widgetsScreen = [
    const NotificationScreen(),
    const ScheduleScreen(),
    const SubscriptionScreen(),
    const HomeScreen(),
    ChatScreen(),
    const WalletScreen()
  ];

  static List<GenericModel> listOfStudentCategories = [
    GenericModel(
      image: AppAssets().student,
      // role: 'student',
      title: AppStrings().testYourself.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().myGrades.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().memoirs.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().private.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().live.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().homeWork.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().tasks.trans,
    ),
  ];
  static List<GenericModel> listOfTeacherCategories = [
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().tests.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().memoirs.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().myGrades.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().homeWork.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().questions.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().live.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().tasks.trans,
    ),
  ];

  static List<GenericModel> studentDrawerItems = [
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().childrenSubscription.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().tasks.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().courses.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().parent.trans,
    ),
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().challenges.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().myGrades.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().firstStudents.trans,
    ),
    //
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().childrenGrades.trans,
    ),
    //
    // GenericModel(
    //   image: AppAssets().teacher,
    //   // role: 'lecture',
    //   title: AppStrings().homeWork.trans,
    // ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().settings.trans,
    ),
    GenericModel(
      // onTap: AppService().getBlocData<UserCubit>().logout(),
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().logout.trans,
    ),
  ];

  static List<GenericModel> drawerItems = [
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().childrenSubscription.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().courses.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().firstStudents.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().teachers.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().childrenGrades.trans,
    ),
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().challenges.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().homeWork.trans,
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().settings.trans,
    ),
    GenericModel(
      // onTap: AppService().getBlocData<UserCubit>().logout(),
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().logout.trans,
    ),
  ];

  static List<GenericModel> featuresItems = [
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: 'اضافة ولي امر',
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: 'اضافة طالب',
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: 'اضافة مجموعات',
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: 'اضافة كورسات',
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: 'ادارة المساعدين',
    ),
  ];

  static List<String> lessonsTabBar = [
    AppStrings().sessions.trans,
    AppStrings().groupInfo.trans
  ];
}
