import 'package:flutter/cupertino.dart';
import 'package:teaching/core/enums.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/model/generic_model.dart';
import 'package:teaching/core/utils/app_assets.dart';
import 'package:teaching/core/utils/app_strings.dart';
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
      id: 4,
      image: AppAssets().professionalCourses,
      role: AppStrings().course,
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
      image: AppAssets().student,
      role: AppStrings().student,
      title: AppStrings().student.trans,
    ),
    GenericModel(
      image: AppAssets().teacher,
      role: AppStrings().lecture,
      title: AppStrings().lecture.trans,
    ),
  ];

  static List<Widget> widgetsScreen = const [
    NotificationScreen(),
    ScheduleScreen(),
    SubscriptionScreen(),
    HomeScreen(),
    ChatScreen(),
    WalletScreen()
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

  static List<GenericModel> drawerItems = [
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: AppStrings().personalInformation.trans,
    ),
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
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: AppStrings().logout.trans,
    ),
  ];
}
