import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching/features/notes/presentation/pages/public_note_screen.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/pages/teacher_for_parent_details_screen.dart';
import 'package:teaching/features/teacher/teachers/presentation/pages/following_teachers_screen.dart';
import 'package:teaching/features/teacher/teachers/presentation/pages/teachers_of_parent_screen.dart';
import 'package:teaching/zego_live/live_screen.dart';
import 'package:teaching/core/utils/app_colors.dart';
import 'package:teaching/core/utils/extensions.dart';
import 'package:teaching/features/Task/Tasks/presentation/pages/student_tasks_screen.dart';
import 'package:teaching/features/about_us/presentation/pages/about_us_screen.dart';
import 'package:teaching/features/ads_details/presentation/pages/ads_details_screen.dart';
import 'package:teaching/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:teaching/features/chat/presentation/pages/chat_group_massages_screen.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/pages/courses_lesson_details_screen.dart';
import 'package:teaching/features/exam/exams/presentation/pages/passed_answer_exam_screen.dart';
import 'package:teaching/features/exam/exams/presentation/pages/exams_screen.dart';
import 'package:teaching/features/exam/exams/presentation/pages/result_exam_screen.dart';
import 'package:teaching/features/exam/exams/presentation/pages/test_yourself_exam_screen.dart';
import 'package:teaching/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/pages/groups_lesson_details_screen.dart';
import 'package:teaching/features/group/groups_details/presentation/pages/groups_details_screen.dart';
import 'package:teaching/features/auth/presentation/pages/main_register_screen.dart';
import 'package:teaching/features/auth/presentation/pages/choose_role_screen.dart';
import 'package:teaching/features/auth/presentation/pages/chosse_professional_courses_screen.dart';
import 'package:teaching/features/auth/presentation/pages/education_type_screen.dart';
import 'package:teaching/features/auth/presentation/pages/forgrt_password_screen.dart';
import 'package:teaching/features/auth/presentation/pages/login_screen.dart';
import 'package:teaching/features/auth/presentation/pages/sign_up_py_phone_screen.dart';
import 'package:teaching/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:teaching/features/auth/presentation/pages/verification_screen.dart';
import 'package:teaching/features/home_work/presentation/pages/home_work_screen.dart';
import 'package:teaching/features/near_school_details/presentation/pages/near_school_details_screen.dart';
import 'package:teaching/features/notes/presentation/pages/notes_booked_unbooked_screen.dart';
import 'package:teaching/features/notes/presentation/pages/notes_details_screen.dart';
import 'package:teaching/features/notes/presentation/pages/notes_screen.dart';
import 'package:teaching/features/notes/presentation/pages/reserve_note_screen.dart';
import 'package:teaching/features/parent/presentation/pages/parent_as_student_pages/add_parent_screen.dart';
import 'package:teaching/features/parent/presentation/pages/parent_as_student_pages/manage_parent_screen.dart';
// import 'package:teaching/features/parent/presentation/pages/parent_as_student_pages/parent_details_screen.dart';
import 'package:teaching/features/parent_children/presentation/pages/parent_children_screen.dart';
import 'package:teaching/features/privacy_policy/presentation/pages/privacy_policy_screen.dart';
import 'package:teaching/features/private/presentation/pages/book_private_appoinment_screen.dart';
import 'package:teaching/features/private/presentation/pages/private_groups_screen.dart';
import 'package:teaching/features/statistics/presentation/pages/statistics_screen.dart';
import 'package:teaching/features/student_profile/profile/presentation/pages/profile_screen.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/pages/video_of_session_screen.dart';
import 'package:teaching/features/sessions/student_group_sessions/presentation/pages/student_group_sessions_screen.dart';
import 'package:teaching/features/settings/presentation/pages/settings_screen.dart';
import 'package:teaching/features/splash_screen.dart';
import 'package:teaching/features/student_profile/profile/presentation/pages/updata_user_profile_screen.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/pages/subscription_course_details_screen.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/pages/subscription_group_details_screen.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/pages/teacher_details_screen.dart';
import 'package:teaching/features/teacher/teachers/presentation/pages/teachers_screen.dart';
import 'package:teaching/features/terms_condition/presentation/pages/terms_condition_screen.dart';
import '../../features/booking_appointment_group/presentation/pages/booking_group_screen.dart';
import '../../features/bottom_nav_bar/presentaion/page/bottom_nav_bar_screen.dart';
import '../../features/course/courses_details/presentation/pages/courses_details_screen.dart';
import '../../features/courses_groups/presentation/pages/public_courses_groups_screen.dart';
import '../../features/grades/my_grades/presentation/pages/my_grades_screen.dart';
import '../../features/language/presentation/managers/language_cubit/language_cubit.dart';
import '../../features/auth/presentation/pages/upload_resume_screen.dart';
import '../../features/on_boarding/presentation/pages/on_boarding_screen.dart';

enum PageRouteAnimation { Fade, Scale, Rotate, Slide, SlideBottomTop }

class Routes {
  Routes._internal();
  static const String splashRoute = "/";
  static const String coursesGroupsRoute = "Courses  Screen";

  static const String statisticsRoute = "/Statistics Route";

  static const String mainRoute = "/main Route";
  static const String loginRoute = "/login Route";
  static const String chooseRoleRoute = "/choose Role";
  static const String signUpRoute = "sign Up";
  static const String onBoardRoute = "/Route onBoard";
  static const String uploadResumeRoute = "upload Resume Route ";
  static const String signUpPyPhoneRoutes = "signUpPyPhoneRoutes";

  static const String educationTypeRoute = " education Type Trip";
  static const String forgetPassRoute = "forget Password";
  static const String verificationRoute = "/verification";
  static const String resetPasswordRoute = "/reset_passsword";
  static const String bottomNavigationRoute = "bottom Navigation Route";
  static const String setPassRoute = "set Password";
  static const String selectLanguageRoute = "/select language";
  //NewTripsScreen
  static const String notificationsRoute = "/notification Route";
  static const String lessonDetailsRoute = "/ Lesson Details";
  static const String coursesDetailsRoute = "Courses Details";
  static const String groupsLessonRoute = "Groups Lesson Details";

  static const String groupsDetailsRoute = "groups Details";
  static const String chooseProfessionalCourseRoute =
      "choose Professional Course Route";
  static const String publicCoursesGroupsRoute = "Public Courses Groups";
  static const String profileRoute = "profile Route";
  static const String followingTeachersRoute = "followingTeachers Route";
  static const String subscriptionOfCourseDetailsRoute =
      "subscription of Course Details";

  static const String privateTeacherDetailsRoute = "PrivateTeacherDetails";

  ///*********************************************************************************\\\

  static const String teachersOfParentRoute = "Teacher Parent Screen";

  static const String teacherDetailsRoute = "Teacher Details Screen";
  static const String teachersRoute = "/Teachers";
  static const String aboutUsRoute = "/ aboutUs";
  static const String favoriteCourseVideoRoute = "/ favorite Course Video";
  // static const String faqRoute = "FAQs";
  static const String subscriptionGroupDetailsRoute =
      "Subscription Group Details";
  static const String settingsRoute = "settings Route";
  //
  static const String bookingDateRoute = "Booking Date";

  //
  static const String studentGroupSessionsRoute = "student Group Sessions";
  //
  static const String termsAndConditionRoute = "Terms And Condition";

  static const String resultExamRoute = "result Exam route";

  static const String nearSchoolDetailsRoute = "near School Details route";
  static const String adsDetailsRoute = "ads Details Route";
  static const String studentTasksRoute = "student Tasks Route";
  static const String personalInformation = "personalInfo";
  static const String editPersonalInformation = "editPersonalInformation";
  static const String fqs = "fqs";
  static const String privacyRoute = "privacy";
  static const String examsRoute = "exams Route";
  static const String passedExamRoute = "Passed Exam";
  static const String myGradesRoute = "my Grades Route";
  static const String pdfRoute = 'Pdf';
  static const String notesRoute = 'Notes';
  static const String publicNotesRoute = 'publicNotesRoute';
  static const String notesBookedUnbookedRoute = 'notes Booked Unbooked';
  static const String notesDetailsRoute = 'Notes Details Screen';
  static const String reserveNoteRoute = "reserve Note Route";
  static const String videoOfSessionRoute = "video Of Session Route";
  static const String updateUserProfileRoute =
      "update User Profile ScreenRoute";
  static const String privateGroupsRoute = "private Groups";
  static const String bookPrivateAppointmentGroupsRoute =
      'bookPrivateAppointmentGroupsRoute';
  static const String examQuestionRoute = 'ExamQuestionScreen';
  static const String parentsRoute = 'Parents Screen';

  static const String addParentRoute = 'add Parents Screen';

  static const String liveRoute = 'Live Screen';
  static const String teacherLiveRoute = 'teacher Live Route ';
  static const String chatMassagesRoute = 'chatMassagesRoute';
  //
  static const String parentsDetailsRoute = 'parentsDetailsRoute';
  //
  static const String homeWorkRoute = 'homeWorkScreen';
  //
  static const String parentChildrenRoute = 'parentChildrenRoute';
  //
  // static const String liveRoute = 'Live Screen';

//
  //
}

class RouteGenerator {
  RouteGenerator._internal();
  PageRouteAnimation? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 100.milliseconds;
  static Route<dynamic>? getRoute(RouteSettings routeSettings) {
    debugPrint(routeSettings.name);
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return buildPageRoute(
            child: const SplashScreen(), routeSettings: routeSettings);
      case Routes.onBoardRoute:
        return buildPageRoute(
            child: OnBoardingScreen(), routeSettings: routeSettings);

      case Routes.mainRoute:
        return buildPageRoute(
            child: const MainRegisterScreen(), routeSettings: routeSettings);
      case Routes.chooseRoleRoute:
        return buildPageRoute(
            child: const ChooseRoleScreen(), routeSettings: routeSettings);
      case Routes.signUpRoute:
        return buildPageRoute(
            child: SignUpScreen(), routeSettings: routeSettings);

      case Routes.groupsDetailsRoute:
        return buildPageRoute(
            child: GroupsDetailsScreen(), routeSettings: routeSettings);
      // case Routes.coursesGroupsRoute:
      //   return buildPageRoute(
      //       child: const CoursesGroupsScreen(), routeSettings: routeSettings);
      case Routes.uploadResumeRoute:
        return buildPageRoute(
            child: UploadResumeScreen(), routeSettings: routeSettings);
      case Routes.signUpPyPhoneRoutes:
        return buildPageRoute(
            child: SignUpByPhoneScreen(), routeSettings: routeSettings);
      case Routes.verificationRoute:
        return buildPageRoute(
            child: VerificationScreen(), routeSettings: routeSettings);

      case Routes.forgetPassRoute:
        return buildPageRoute(
            child: ForgetPasswordScreen(), routeSettings: routeSettings);
      case Routes.chooseProfessionalCourseRoute:
        return buildPageRoute(
            child: const ChooseProfessionalCoursesScreen(),
            routeSettings: routeSettings);
      case Routes.bottomNavigationRoute:
        return buildPageRoute(
            child: const BottomNavBarScreen(), routeSettings: routeSettings);
      case Routes.coursesDetailsRoute:
        return buildPageRoute(
            child: CoursesDetailsScreen(), routeSettings: routeSettings);
      case Routes.lessonDetailsRoute:
        return buildPageRoute(
            child: const LessonDetailsScreen(), routeSettings: routeSettings);
      case Routes.groupsLessonRoute:
        return buildPageRoute(
            child: const GroupsLessonDetailsScreen(),
            routeSettings: routeSettings);
      case Routes.profileRoute:
        return buildPageRoute(
            child: const ProfileScreen(), routeSettings: routeSettings);
      case Routes.resetPasswordRoute:
        return buildPageRoute(
            child: ResetPasswordScreen(), routeSettings: routeSettings);
      case Routes.publicCoursesGroupsRoute:
        return buildPageRoute(
            child: const PublicCoursesGroupsScreen(),
            routeSettings: routeSettings);
      case Routes.subscriptionOfCourseDetailsRoute:
        return buildPageRoute(
            child: SubscriptionOfCourseDetailsScreen(),
            routeSettings: routeSettings);
      case Routes.favoriteCourseVideoRoute:
        return buildPageRoute(
            child: const FavoriteScreen(), routeSettings: routeSettings);
      //
      case Routes.teacherDetailsRoute:
        return buildPageRoute(
            child: TeacherDetailsScreen(), routeSettings: routeSettings);
      case Routes.teachersOfParentRoute:
        return buildPageRoute(
            child: TeachersOfParentScreen(), routeSettings: routeSettings);

      case Routes.privateTeacherDetailsRoute:
        return buildPageRoute(
            child: PrivateTeacherDetailsScreen(), routeSettings: routeSettings);
      case Routes.teachersRoute:
        return buildPageRoute(
            child: const TeachersScreen(), routeSettings: routeSettings);
      //
      case Routes.educationTypeRoute:
        return buildPageRoute(
            child: EducationTypeScreen(), routeSettings: routeSettings);
      case Routes.termsAndConditionRoute:
        return buildPageRoute(
            child: const TermsConditionScreen(), routeSettings: routeSettings);
      //
      case Routes.aboutUsRoute:
        return buildPageRoute(
            child: AboutUsScreen(), routeSettings: routeSettings);
      case Routes.subscriptionGroupDetailsRoute:
        return buildPageRoute(
            child: SubscriptionGroupDetailsScreen(),
            routeSettings: routeSettings);
      case Routes.privacyRoute:
        return buildPageRoute(
            child: const PrivacyPolicyScreen(), routeSettings: routeSettings);
      case Routes.studentGroupSessionsRoute:
        return buildPageRoute(
            child: StudentGroupSessionsScreen(), routeSettings: routeSettings);
      case Routes.bookingDateRoute:
        return buildPageRoute(
            child: BookingAppointmentGroupScreen(),
            routeSettings: routeSettings);
      //
      case Routes.nearSchoolDetailsRoute:
        return buildPageRoute(
            child: NearSchoolDetailsScreen(), routeSettings: routeSettings);
      // //
      case Routes.adsDetailsRoute:
        return buildPageRoute(
            child: AdsDetailsScreen(), routeSettings: routeSettings);
      //
      case Routes.examsRoute:
        return buildPageRoute(
            child: ExamsScreen(), routeSettings: routeSettings);
      case Routes.studentTasksRoute:
        return buildPageRoute(
            child: StudentTasksScreen(), routeSettings: routeSettings);
      case Routes.resultExamRoute:
        return buildPageRoute(
            child: ResultExamScreen(), routeSettings: routeSettings);

      case Routes.passedExamRoute:
        return buildPageRoute(
          child: PassedExamScreen(),
          routeSettings: routeSettings,
        );
      //
      case Routes.myGradesRoute:
        return buildPageRoute(
            child: MyGradesScreen(), routeSettings: routeSettings);
      // case Routes.pdfRoute:
      //   return buildPageRoute(child: PdfScreen(), routeSettings: routeSettings);
      case Routes.notesBookedUnbookedRoute:
        return buildPageRoute(
            child: const NotesBookedUnbookedScreen(),
            routeSettings: routeSettings);
      //
      case Routes.loginRoute:
        return buildPageRoute(
            child: LoginScreen(), routeSettings: routeSettings);
      //
      //
      case Routes.notesRoute:
        return buildPageRoute(
            child: NotesScreen(), routeSettings: routeSettings);
      case Routes.publicNotesRoute:
        return buildPageRoute(
            child: PublicNoteScreen(), routeSettings: routeSettings);

      // //*************************** settings rout ********************************/
      //
      case Routes.parentChildrenRoute:
        return buildPageRoute(
            child: ParentChildrenScreen(), routeSettings: routeSettings);

      case Routes.notesDetailsRoute:
        return buildPageRoute(
            child: NotesDetailsScreen(), routeSettings: routeSettings);
      //   //
      case Routes.reserveNoteRoute:
        return buildPageRoute(
            child: ReserveNoteScreen(), routeSettings: routeSettings);
      //   //
      case Routes.videoOfSessionRoute:
        return buildPageRoute(
            child: VideoOfSessionScreen(), routeSettings: routeSettings);
      //   //
      case Routes.updateUserProfileRoute:
        return buildPageRoute(
            child: UpdateUserProfileScreen(), routeSettings: routeSettings);
      //   //
      case Routes.privateGroupsRoute:
        return buildPageRoute(
            child: PrivateGroupsScreen(), routeSettings: routeSettings);
      //   //
      case Routes.bookPrivateAppointmentGroupsRoute:
        return buildPageRoute(
            child: BookPrivateAppointmentScreen(),
            routeSettings: routeSettings);
      //   //
      case Routes.examQuestionRoute:
        return buildPageRoute(
            child: ExamQuestionScreen(), routeSettings: routeSettings);
      case Routes.addParentRoute:
        return buildPageRoute(
            child: AddParentScreen(), routeSettings: routeSettings);

      case Routes.parentsRoute:
        return buildPageRoute(
            child: ParentsScreen(), routeSettings: routeSettings);
      case Routes.homeWorkRoute:
        return buildPageRoute(
            child: HomeWorkScreen(), routeSettings: routeSettings);
      case Routes.liveRoute:
        return buildPageRoute(
            child: LiveScreen(), routeSettings: routeSettings);

      case Routes.followingTeachersRoute:
        return buildPageRoute(
            child: FollowingTeachersScreen(), routeSettings: routeSettings);
      //
      case Routes.chatMassagesRoute:
        return buildPageRoute(
            child: ChatGroupMassagesScreen(), routeSettings: routeSettings);
      //
      // case Routes.parentsDetailsRoute:
      //   return buildPageRoute(
      //       child: ParentDetailsScreen(), routeSettings: routeSettings);
      case Routes.statisticsRoute:
        return buildPageRoute(
            child: StatisticsScreen(), routeSettings: routeSettings);

      //
      //

      // case Routes.personalInformation:
      //   return buildPageRoute(
      //       child: BlocProvider(
      //         create: (context) => ErrorCubit(),
      //         child: const PersonalInformationScreen(),
      //       ),
      //       routeSettings: routeSettings);
      // case Routes.editPersonalInformation:
      //   return buildPageRoute(
      //       child: ProfileInformationWidget(), routeSettings: routeSettings);
      // case Routes.fqs:
      //   return buildPageRoute(
      //       child: BlocProvider<FaqCubit>(
      //         create: (context) => ServiceLocator().getIt<FaqCubit>()..getFAQ(),
      //         child: FAQSScreen(),
      //       ),
      //       routeSettings: routeSettings);
      //
      case Routes.settingsRoute:
        return buildPageRoute(
            child: SettingsScreen(), routeSettings: routeSettings);
    }
    return buildPageRoute(
        child: const Center(
          child: Text("no route found"),
        ),
        routeSettings: routeSettings);
  }

  static Route<T> buildPageRoute<T>({
    required Widget child,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
    RouteSettings? routeSettings,
  }) {
    pageRouteAnimation = pageRouteAnimation ?? PageRouteAnimation.Scale;
    if (pageRouteAnimation != null) {
      if (pageRouteAnimation == PageRouteAnimation.Fade) {
        return PageRouteBuilder(
          settings: routeSettings,
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
          reverseTransitionDuration: const Duration(milliseconds: 50),
          pageBuilder: (context, a1, a2) =>
              BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Directionality(
                  textDirection: context.read<LanguageCubit>().isEn
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: child);
            },
          ),
          transitionsBuilder: (c, anim, a2, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Rotate) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Directionality(
                  textDirection: context.read<LanguageCubit>().isEn
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: child);
            },
          ),
          transitionsBuilder: (c, anim, a2, child) {
            return RotationTransition(
                child: child, turns: ReverseAnimation(anim));
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Scale) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Directionality(
                  textDirection: context.read<LanguageCubit>().isEn
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: child);
            },
          ),
          transitionsBuilder: (c, anim, a2, child) {
            return ScaleTransition(child: child, scale: anim);
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Slide) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Directionality(
                  textDirection: context.read<LanguageCubit>().isEn
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: child);
            },
          ),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.SlideBottomTop) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) =>
              BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Directionality(
                  textDirection: context.read<LanguageCubit>().isEn
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: child);
            },
          ),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      }
    }
    return MaterialPageRoute<T>(
      builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Directionality(
                  textDirection: context.read<LanguageCubit>().isEn
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: child);
            },
          )),
      settings: routeSettings,
    );
  }
}
