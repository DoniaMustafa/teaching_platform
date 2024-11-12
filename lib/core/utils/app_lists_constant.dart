import 'package:teaching/agora/live_screen.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';

class AppListsConstant {
  static List<String> tabsBar = [
    AppStrings().contents.trans,
    AppStrings().comments.trans,
    AppStrings().attachments.trans,
    AppStrings().exams.trans,
  ];
  static List<String> sessionTabsBar = [
    AppStrings().contents.trans,
    AppStrings().comments.trans,
    AppStrings().attachments.trans,
    AppStrings().exams.trans,
    AppStrings().homeWork.trans,
  ];
  // static  List<String> pathUrl = [
  //   'https://www.youtube.com/watch?v=c84s0JWdEKg',
  //   'https://www.youtube.com/watch?v=UJgDKAQmRCI',
  //   "https://www.youtube.com/watch?v=CBlFFEWnnEc",
  //   "https://www.youtube.com/watch?v=YUR38NnvJV4"
  // ];
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
  static List<String> parentChildren = [
    AppStrings().children.trans,
    AppStrings().parentRequest.trans,
  ];
  static List<String> homeworkTab = [
    AppStrings().delivered.trans,
    AppStrings().notDelivered.trans,
  ];

  static List<String> private = [
    AppStrings().groups.trans,
    AppStrings().bookDate.trans,
  ];
  static List<String> parents = [
    AppStrings().parents.trans,
    AppStrings().parentRequest.trans,
  ];
  static List<String> notes = [
    AppStrings().bookedNotes.trans,
    AppStrings().unbookedNotes.trans,
  ];
  static List<String> sessionsTab = [
    AppStrings().previousClasses.trans,
    AppStrings().nextClasses.trans,
  ];
  static List<String> exams = [
    AppStrings().passed.trans,
    AppStrings().notPassed.trans,
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

  static List<GenericModel> listOfStudentCategories =  [];
  static List<GenericModel> listOfSParentCategories =[];
  static List<GenericModel> listOfTeacherCategories = [];

  static List<GenericModel> studentDrawerItems = [];
  static List<GenericModel> parentDrawerItems = [];

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

  static List<GenericModel> parentFeaturesItems = [
    GenericModel(
      // image: AppAssets().student,
      // role: 'student',
      title: 'اضافة ابناء',
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: 'اضافة معلم',
    ),
    GenericModel(
      // image: AppAssets().teacher,
      // role: 'lecture',
      title: 'متابعة مدرس',
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
    AppStrings().groupInfo.trans,
    AppStrings().sessions.trans,
  ];

  static List<String> settings = [
    AppStrings().language.trans,
    AppStrings().changePassword.trans,
    AppStrings().aboutUs.trans,
    AppStrings().privacyPolice.trans,
    AppStrings().termsAndConditions.trans,
    AppStrings().logout.trans,
  ];

//////////////////////////appointment date of Group///////////////////////////////////
  static List<GenericModel> subscriptionDurationGroup = [
    GenericModel(
      id: 1,
      title: AppStrings().session.trans,
    ),
    GenericModel(
      id: 2,
      title: AppStrings().month.trans,
    ),
    GenericModel(
      id: 3,
      title: AppStrings().term.trans,
    ),
    GenericModel(
      id: 4,
      title: AppStrings().year.trans,
    ),
  ];
  static List<GenericModel> periodOfDay = [
    GenericModel(
      id: 1,
      title: AppStrings().morning.trans,
    ),
    GenericModel(
      id: 2,
      title: AppStrings().night.trans,
    ),
  ];
  static List<GenericModel> groupType = [
    GenericModel(
      id: 1,
      title: AppStrings().individual.trans,
    ),
    GenericModel(
      id: 2,
      title: AppStrings().group.trans,
    ),
  ];
}
