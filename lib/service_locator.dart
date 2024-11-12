import 'package:get_it/get_it.dart';
import 'package:teaching/agora/cubit/agora_cubit.dart';
import 'package:teaching/features/Task/Tasks/data/data_sources/student_tasks_data_source.dart';
import 'package:teaching/features/Task/Tasks/data/repositories/student_tasks_implement.dart';
import 'package:teaching/features/Task/Tasks/domain/repositories/student_tasks_repo.dart';
import 'package:teaching/features/Task/Tasks/domain/use_cases/student_tasks_use_case.dart';
import 'package:teaching/features/Task/Tasks/presentation/manager/student_tasks_cubit.dart';
import 'package:teaching/features/ads_details/data/data_sources/ads_details_data_source.dart';
import 'package:teaching/features/ads_details/data/repositories/ads_details_implement.dart';
import 'package:teaching/features/ads_details/domain/repositories/ads_details_repo.dart';
import 'package:teaching/features/ads_details/domain/use_cases/ads_details_use_case.dart';
import 'package:teaching/features/auth/data/data_sources/country_remote_datasource.dart';
import 'package:teaching/features/auth/data/data_sources/education_type_remote_datasource.dart';
import 'package:teaching/features/auth/data/data_sources/user_local_datasource.dart';
import 'package:teaching/features/auth/data/data_sources/user_remote_datasource.dart';
import 'package:teaching/features/auth/data/repositories/country_implement.dart';
import 'package:teaching/features/auth/data/repositories/education_type_implement.dart';
import 'package:teaching/features/auth/data/repositories/user_repo_impl.dart';
import 'package:teaching/features/auth/domain/repositories/countries_repo.dart';
import 'package:teaching/features/auth/domain/repositories/education_type_repo.dart';
import 'package:teaching/features/auth/domain/repositories/user_repo.dart';
import 'package:teaching/features/auth/domain/use_cases/countries_use_case.dart';
import 'package:teaching/features/auth/domain/use_cases/user_usecases.dart';
import 'package:teaching/features/auth/presentation/manager/countries/city_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/countries/region_cubit.dart';
import 'package:teaching/features/booking_appointment_group/data/data_sources/booking_appointment_data_source.dart';
import 'package:teaching/features/booking_appointment_group/data/repositories/booking_appointment_implement.dart';
import 'package:teaching/features/booking_appointment_group/domain/repositories/booking_appointment_repo.dart';
import 'package:teaching/features/booking_appointment_group/domain/use_cases/booking_appointment_use_casee.dart';
import 'package:teaching/features/booking_appointment_group/presentation/manager/booking_appointment_cubit.dart';
import 'package:teaching/features/chat/data/data_sources/chat_data_source.dart';
import 'package:teaching/features/chat/data/repositories/chat_implement.dart';
import 'package:teaching/features/chat/domain/use_cases/chat_use_casee.dart';
import 'package:teaching/features/chat/presentation/manager/chat_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_group_massages_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_of_group_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/send_massage_to_group_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/teacher_to_chat_cubit.dart';
import 'package:teaching/features/course/courses_details/data/data_sources/subscribe_course_data_source.dart';
import 'package:teaching/features/course/courses_details/data/repositories/courses_details_implement.dart';
import 'package:teaching/features/course/courses_details/data/repositories/subscribe_courses_implement.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/courses_details_repo.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/subscribe_courses_repo.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/courses_details_use_case.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/subscribe_courses_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/comment_on_lessons_data_sources.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/favorite_video_data_source.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/rate_data_source.dart';
import 'package:teaching/features/course/courses_lessons_details/data/repositories/comment_on_lessons_implement.dart';
import 'package:teaching/features/course/courses_lessons_details/data/repositories/favorite_video_implement.dart';
import 'package:teaching/features/course/courses_lessons_details/data/repositories/rate_implement.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/comment_on_lessons_repo.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/favorite_unfavorite_video_repo.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/rate_repo.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/comment_on_lessons_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/favorite_unfavorite_video_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/rate_uescase.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/vimeo_video_cubit.dart';
import 'package:teaching/features/courses_groups/data/data_sources/public_groups_courses_Data_source.dart';
import 'package:teaching/features/courses_groups/data/data_sources/subject_Data_source.dart';
import 'package:teaching/features/courses_groups/data/repositories/public_groups_courses_implement.dart';
import 'package:teaching/features/courses_groups/data/repositories/subject_implement.dart';
import 'package:teaching/features/courses_groups/domain/repositories/subject_repo.dart';
import 'package:teaching/features/courses_groups/domain/use_cases/subject_use_case.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_operation_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/passed_answer_exam_cubit.dart';
import 'package:teaching/features/exam/exams/data/data_sources/exam_data_source.dart';
import 'package:teaching/features/exam/exams/data/repositories/exam_implement.dart';
import 'package:teaching/features/exam/exams/domain/repositories/exam_repo.dart';
import 'package:teaching/features/exam/exams/domain/use_cases/exam_use_case.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/submit_exam_cubit.dart';
import 'package:teaching/features/favorite/data/data_sources/favorite_video_courses_data_source.dart';
import 'package:teaching/features/favorite/data/repositories/favorite_video_courses_implement.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_courses_repo.dart';
import 'package:teaching/features/favorite/domain/use_cases/favorite_video_courses_use_case.dart';
import 'package:teaching/features/grades/my_grades/data/data_sources/my_grades_data_source.dart';
import 'package:teaching/features/grades/my_grades/data/repositories/my_grades_implement.dart';
import 'package:teaching/features/grades/my_grades/domain/repositories/my_grades_repo.dart';
import 'package:teaching/features/grades/my_grades/domain/use_cases/my_grades_use_case.dart';
import 'package:teaching/features/grades/my_grades/presentation/manager/my_grades_cubit.dart';
import 'package:teaching/features/group/group_lessons_details/data/data_sources/group_lessons_details_data_sources.dart';
import 'package:teaching/features/group/group_lessons_details/data/data_sources/subscription_group_data_sources.dart';
import 'package:teaching/features/group/group_lessons_details/data/repositories/group_lessons_details_implement.dart';
import 'package:teaching/features/group/group_lessons_details/data/repositories/subscription_group_implement.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/group_lessons_details_repo.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/subscription_group_repo.dart';
import 'package:teaching/features/group/group_lessons_details/domain/use_cases/group_lessons_details_use_case.dart';
import 'package:teaching/features/group/group_lessons_details/domain/use_cases/subscription_group_use_case.dart';
import 'package:teaching/features/group/groups_details/data/data_sources/group_lessons_details_data_sources.dart';
import 'package:teaching/features/group/groups_details/data/repositories/group_details_implement.dart';
import 'package:teaching/features/group/groups_details/domain/repositories/group_details_repo.dart';
import 'package:teaching/features/home/data/data_sources/student/ads_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/near_school_data_source.dart';
import 'package:teaching/features/home/presentation/manager/home_operation_cubit.dart';
import 'package:teaching/features/home_work/data/data_sources/home_work_data_source.dart';
import 'package:teaching/features/home_work/data/repositories/home_work_implement.dart';
import 'package:teaching/features/home_work/domain/repositories/home_work_repo.dart';
import 'package:teaching/features/home_work/domain/use_cases/home_work_use_case.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/my_homework_cubit.dart';
import 'package:teaching/features/notes/data/data_sources/notes_data_source.dart';
import 'package:teaching/features/parent/presentation/manager/delete_student_cubit.dart';
import 'package:teaching/features/parent_children/data/data_sources/parent_children_data_source.dart';
import 'package:teaching/features/notes/data/repositories/notes_implement.dart';
import 'package:teaching/features/parent_children/data/repositories/parent_children_implement.dart';
import 'package:teaching/features/notes/domain/repositories/notes_repo.dart';
import 'package:teaching/features/parent_children/domain/repositories/parent_children_repo.dart';
import 'package:teaching/features/notes/domain/use_cases/notes_use_case.dart';
import 'package:teaching/features/parent_children/domain/use_cases/parent_children_ruse_caseo.dart';
import 'package:teaching/features/notes/presentation/manager/notes_booked_unbooked_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_details_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_operation_cubit.dart';
import 'package:teaching/features/parent_children/presentation/manager/children_operation_cubit.dart';
import 'package:teaching/features/parent_children/presentation/manager/parent_children_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/reserve_note_cubit.dart';
import 'package:teaching/features/parent/data/data_sources/parent_data_source.dart';
import 'package:teaching/features/parent/data/repositories/parent_implement.dart';
import 'package:teaching/features/parent/domain/repositories/parent_repo.dart';
import 'package:teaching/features/parent/domain/use_cases/parent_use_case.dart';
import 'package:teaching/features/parent/presentation/manager/accept_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/add_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/cancel_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_count_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_operation_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_to_request_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/reject_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/student_request_parents_cubit.dart';
import 'package:teaching/features/private/presentation/manager/private_groups_operation_cubit.dart';
import 'package:teaching/features/private/presentation/manager/private_teachers_group_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/data/data_sources/video_of_session_details_data_sources.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/exam_video_of_session_operation_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_data_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';
import 'package:teaching/features/subscriptions/subscription/data/data_sources/subscriptions_data_source.dart';
import 'package:teaching/features/home/data/repositories/student/ads_implement.dart';
import 'package:teaching/features/home/data/repositories/student/near_school_implement.dart';
import 'package:teaching/features/subscriptions/subscription/data/repositories/subscription_implement.dart';
import 'package:teaching/features/home/data/repositories/student/teacher_of_student_implement.dart';
import 'package:teaching/features/home/domain/repositories/student/ads_repo.dart';
import 'package:teaching/features/home/domain/repositories/student/near_school_repo.dart';
import 'package:teaching/features/subscriptions/subscription/domain/repositories/subscription_repo.dart';
import 'package:teaching/features/home/domain/repositories/student/teacher_of_student_repo.dart';
import 'package:teaching/features/home/domain/use_cases/student/ads_use_case.dart';
import 'package:teaching/features/home/domain/use_cases/student/near_school_use_case.dart';
import 'package:teaching/features/home/domain/use_cases/student/teacher_of_student_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/lessons_details_data_sources.dart';
import 'package:teaching/features/course/courses_lessons_details/data/repositories/lessons_details_implement.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/lessons_details_use_case.dart';
import 'package:teaching/features/near_school_details/data/data_sources/near_school_details_data_sourec.dart';
import 'package:teaching/features/near_school_details/data/repositories/near_school_details_implement.dart';
import 'package:teaching/features/near_school_details/domain/repositories/near_school_details_repo.dart';
import 'package:teaching/features/near_school_details/domain/use_cases/near_school_details_use_case.dart';
import 'package:teaching/features/notification/data/data_sources/notification_data_sourec.dart';
import 'package:teaching/features/notification/data/repositories/notification_implement.dart';
import 'package:teaching/features/notification/domain/repositories/notification_repo.dart';
import 'package:teaching/features/notification/domain/use_cases/notification_use_case.dart';
import 'package:teaching/features/on_boarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:teaching/features/on_boarding/data/repositories/onboarding_repo_impl.dart';
import 'package:teaching/features/on_boarding/domain/repositories/onboarding_repo.dart';
import 'package:teaching/features/on_boarding/domain/usecase/onborading_usecases.dart';
import 'package:teaching/features/schedule/data/data_sources/schedule_data_source.dart';
import 'package:teaching/features/schedule/data/repositories/schedule_implement.dart';
import 'package:teaching/features/schedule/domain/repositories/schedule_repo.dart';
import 'package:teaching/features/schedule/domain/use_cases/schedule_use_case.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/data_sources/sessions_of_group_date_source.dart';
import 'package:teaching/features/sessions/student_group_sessions/data/repositories/sessions_of_group_implement.dart';
import 'package:teaching/features/sessions/student_group_sessions/domain/repositories/sessions_of_group_repo.dart';
import 'package:teaching/features/sessions/student_group_sessions/domain/use_cases/sessions_of_group_use_case.dart';
import 'package:teaching/features/subscriptions/subscription/presentation/manager/subscription_courses_cubit.dart';
import 'package:teaching/features/subscriptions/subscription_details/data/data_sources/subscription_details_data_source.dart';
import 'package:teaching/features/subscriptions/subscription_details/data/repositories/subscription_details_implement.dart';
import 'package:teaching/features/subscriptions/subscription_details/domain/repositories/subscription_details_repo.dart';
import 'package:teaching/features/subscriptions/subscription_details/domain/use_cases/subscription_details_use_Case.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/manager/subscriptipn_course_details_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/data/data_sources/teacher_details_data_source.dart';
import 'package:teaching/features/teacher/teacher_details/data/repositories/teacher_details_implement.dart';
import 'package:teaching/features/teacher/teacher_details/domain/repositories/teacher_details_repo.dart';
import 'package:teaching/features/teacher/teacher_details/domain/use_cases/teacher_details_use_case.dart';
import 'package:teaching/features/wallet/data/data_sources/user_transaction.dart';

import 'core/export/export.dart';
import 'core/network/impl/dio_impl/dio_interceptors.dart';
import 'core/permission_handler.dart';
import 'features/chat/domain/repositories/chat_repo.dart';
import 'features/course/courses_details/data/data_sources/courses_details_data_source.dart';
import 'features/courses_groups/domain/repositories/public_groups_courses_repo.dart';
import 'features/courses_groups/domain/use_cases/public_groups_courses_use_case.dart';
import 'features/favorite/data/data_sources/favorite_video_group_data_source.dart';
import 'features/favorite/data/repositories/favorite_video_groups_implement.dart';
import 'features/favorite/domain/repositories/favorite_video_groups_repo.dart';
import 'features/favorite/domain/use_cases/favorite_video_groups_use_case.dart';
import 'features/home/data/data_sources/student/groups_data_source.dart';
import 'features/home/data/data_sources/student/teachers_of_student_data_source.dart';
import 'features/home/data/repositories/student/courses_groups_implement.dart';
import 'features/home/data/repositories/student/groups_implement.dart';
import 'features/home/domain/repositories/student/courses_repo.dart';
import 'features/home/domain/repositories/student/groups_repo.dart';
import 'features/home/domain/use_cases/student/courses_groups_use_case.dart';
import 'features/home/domain/use_cases/student/groups_use_case.dart';
import 'features/language/data/data_sources/language_local_datasource.dart';
import 'features/language/data/repositories/language_repo_impl.dart';
import 'features/language/domain/repositories/language_repo.dart';
import 'features/language/domain/use_cases/language_usecases.dart';
import 'features/course/courses_lessons_details/domain/repositories/lessons_details_repo.dart';
import 'features/private/data/data_sources/private_groups_data_source.dart';
import 'features/private/data/repositories/private_groups_implement.dart';
import 'features/private/domain/repositories/private_groups_repo.dart';
import 'features/private/domain/use_cases/private_groups_use_case.dart';
import 'features/private/presentation/manager/private_groups_cubit.dart';
import 'features/sessions/session_video_details/data/repositories/video_of_session_details_implement.dart';
import 'features/sessions/session_video_details/domain/repositories/video_of_session_details_repo.dart';
import 'features/sessions/session_video_details/domain/use_cases/video_of_session_details_use_case.dart';
import 'features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_details_cubit.dart';
import 'features/subscriptions/subscription/presentation/manager/subscription_groups_cubit.dart';
import 'features/wallet/data/repositories/user_transaction_implement.dart';
import 'features/wallet/domain/repositories/user_transaction_repo.dart';
import 'features/wallet/domain/use_cases/user_transaction_use_case.dart';

class ServiceLocator {
  GetIt getIt = GetIt.instance;

  /// Factory method that reuse same instance automatically

  static ServiceLocator instance =
      ServiceLocator._internal(); // named constructor

  /// Private constructor
  ServiceLocator._internal();
  factory ServiceLocator() => instance; // singleton
  Future<void> get init async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => preferences);
    registerLanguage;
    registerPermission;
    registerCountries;
    // await registerPrefs;
    registerUser;
    registerErrorAndOperation;
    registerNetwork;
    registerTeachersOfStudent;
    registerSubscription;
    registerAds;
    registerNearSchool;
    registerCourses;
    registerGroups;
    registerOnboarding;
    registerCoursesDetails;
    registerCoursesLessonsDetails;
    registerGroupDetails;
    registerGroupLessonsDetails;
    registerSubjects;
    registerPublicCoursesGroups;
    registerTeacherDetails;
    registerSubscribeCourse;
    registerVideoRate;
    registerExam;
    registerFavoriteVideosCourses;
    // registerTermsAndCondition;
    registerFavoriteUnFavoriteCourseVideo;
    registerNotification;
    registerCommentOnLesson;
    registerFavoriteVideosGroup;
    registerSubscriptionGroupDetails;
    registerEducation;
    registerTransaction;
    registerSchedule;
    registerSubscriptionOfGroup;
    registerSessionsOfGroup;
    registerNearSchoolDetails;
    registerAdsDetails;
    registerMyGrades;
    registerHomework;
    // registerTestYourself;
    registerNotes;
    registerVideoOfSessionGroup;
    registerBookingAppointment;
    registerPrivateGroups;
    registerParent;
    registerParentChildren;

    registerChat;

    getIt.registerLazySingleton<HomeOperationCubit>(() => HomeOperationCubit());
    getIt.registerLazySingleton<AgoraCubit>(() => AgoraCubit());



  }

  get registerLanguage {
    getIt.registerLazySingleton<LanguageLocalDataSource>(
        () => LanguageImplWithPrefs(sharedPreferences: getIt()));
    getIt.registerLazySingleton<LanguageRepo>(() => LanguageRepoImpl(
        languageLocalDataSource:
            LanguageImplWithPrefs(sharedPreferences: getIt())));
    getIt.registerLazySingleton<LanguageUseCases>(() => LanguageUseCases(
        languageRepo: LanguageRepoImpl(languageLocalDataSource: getIt())));
    getIt.registerFactory<LanguageCubit>(() => LanguageCubit(
        languageUseCases: LanguageUseCases(languageRepo: getIt())));
    getIt.registerFactory<LanguageOperationCubit>(
        () => LanguageOperationCubit());
  }

  get registerOnboarding {
    getIt.registerLazySingleton<OnBoardingLocalDataSource>(() =>
        OnBoardingLocalDataSourceImplWithPrefs(sharedPreferences: getIt()));
    getIt.registerLazySingleton<OnBoardingRepo>(
        () => OnBoardingRepoImpl(onBoardingLocalDataSource: getIt()));
    getIt.registerLazySingleton<OnBoardingUsesCases>(
        () => OnBoardingUsesCases(onBoardingRepo: getIt()));
    getIt.registerLazySingleton<OnboardingManagerCubit>(
        () => OnboardingManagerCubit(onBoardingUsesCases: getIt()));
  }

  get registerErrorAndOperation {
    getIt.registerLazySingleton<ErrorCubit>(() => ErrorCubit());
    getIt.registerLazySingleton<CoursesGroupOperationCubit>(
        () => CoursesGroupOperationCubit());

    getIt.registerLazySingleton<AttachmentsOperationCubit>(
        () => AttachmentsOperationCubit());
    getIt.registerLazySingleton<BottomNavBarOperationCubit>(
        () => BottomNavBarOperationCubit());

    getIt.registerLazySingleton<FileManagerCubit>(() => FileManagerCubit());
    getIt.registerLazySingleton<ExamOperationCubit>(() => ExamOperationCubit());
  }

  get registerNetwork {
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
    getIt.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(
        client: getIt(), dioInterceptor: getIt(), logInterceptor: getIt())
      ..dioInit());
    /*********************************** end of network  ****************************************/
  }

  get registerTeachersOfStudent {
    getIt.registerLazySingleton<TeachersOfStudentDataSource>(
        () => TeachersOfStudentWithServer(getIt()));
    getIt.registerLazySingleton<TeacherOfStudentRepo>(
        () => TeacherOfStudentImplement(getIt()));
    getIt.registerLazySingleton<TeacherOfStudentUseCase>(
        () => TeacherOfStudentUseCase(getIt()));
    getIt.registerLazySingleton<TeachersOfStudentCubit>(
        () => TeachersOfStudentCubit(getIt()));
  }

  get registerSubscription {
    getIt.registerLazySingleton<SubscriptionsDataSource>(
        () => SubscriptionsWithServer(getIt()));
    getIt.registerLazySingleton<SubscriptionRepo>(
        () => SubscriptionImplement(getIt()));
    getIt.registerLazySingleton<SubscriptionUseCase>(
        () => SubscriptionUseCase(getIt()));
    getIt.registerLazySingleton<SubscriptionCubit>(
        () => SubscriptionCubit(getIt()));
    getIt.registerLazySingleton<SubscriptionCoursesCubit>(
        () => SubscriptionCoursesCubit(getIt()));
    getIt.registerLazySingleton<SubscriptionGroupsCubit>(
        () => SubscriptionGroupsCubit(getIt()));
    getIt.registerLazySingleton<SubscriptionOperationCubit>(
        () => SubscriptionOperationCubit());
  }

  get registerAds {
    getIt.registerLazySingleton<AdsDataSource>(() => AdsWithServer(getIt()));
    getIt.registerLazySingleton<AdsRepo>(() => AdsImplement(getIt()));
    getIt.registerLazySingleton<AdsUseCase>(() => AdsUseCase(getIt()));
    getIt.registerLazySingleton<AdsCubit>(() => AdsCubit(getIt()));
  }

  get registerCourses {
    getIt.registerLazySingleton<CoursesDataSource>(
        () => CoursesWithServer(getIt()));
    getIt.registerLazySingleton<CoursesRepo>(() => CoursesImplement(getIt()));
    getIt.registerLazySingleton<CoursesUseCase>(() => CoursesUseCase(getIt()));
    getIt.registerLazySingleton<CoursesCubit>(() => CoursesCubit(getIt()));
  }

  get registerGroups {
    getIt.registerLazySingleton<GroupsDataSource>(
        () => GroupsWithServer(getIt()));
    getIt.registerLazySingleton<GroupsRepo>(() => GroupsImplement(getIt()));
    getIt.registerLazySingleton<GroupsUseCase>(() => GroupsUseCase(getIt()));
    getIt.registerLazySingleton<GroupsCubit>(() => GroupsCubit(getIt()));
  }

  get registerNearSchool {
    getIt.registerLazySingleton<NearSchoolDataSource>(
        () => NearSchoolWithServer(getIt()));
    getIt.registerLazySingleton<NearSchoolRepo>(
        () => NearSchoolImplement(getIt()));
    getIt.registerLazySingleton<NearSchoolUseCase>(
        () => NearSchoolUseCase(getIt()));
    getIt
        .registerLazySingleton<NearSchoolCubit>(() => NearSchoolCubit(getIt()));
  }

  get registerUser {
    getIt.registerLazySingleton<UserLocalDataSource>(
        () => UserImplWithPrefs(sharedPreferences: getIt()));
    getIt.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(dioConsumer: getIt()));
    getIt.registerLazySingleton<UserRepo>(() => UserRepoImpl(
        userLocalDataSource: getIt(), userRemoteDataSource: getIt()));
    getIt
        .registerLazySingleton<UserUseCases>(() => UserUseCases(repo: getIt()));
    getIt.registerLazySingleton<UserCubit>(
        () => UserCubit(userUsecases: getIt()..getUser()));
    // getIt.registerLazySingleton<EditOperationCubit>(() => EditOperationCubit());
  }
//

//
  get registerEducation {
    getIt.registerLazySingleton<EducationTypeRemoteDatasource>(
        () => EducationTypeWithServer(dioConsumer: getIt()));
    getIt.registerLazySingleton<EducationTypeRepo>(
        () => EducationTypeImplement(getIt()));
    getIt.registerLazySingleton<EducationTypeUseCase>(
        () => EducationTypeUseCase(getIt()));
    getIt.registerLazySingleton<EducationCubit>(() => EducationCubit(getIt()));
    getIt.registerLazySingleton<StageCubit>(() => StageCubit(getIt()));
    getIt.registerLazySingleton<ProgramCubit>(() => ProgramCubit(getIt()));
    getIt.registerLazySingleton<SubjectCubit>(() => SubjectCubit(getIt()));
  }

//
  get registerCoursesDetails {
    getIt.registerLazySingleton<CoursesDetailsDataSource>(
        () => CoursesDetailsWithServer(getIt()));
    // getIt.registerLazySingleton<AdsLocalDataSource>(() => AdsLocalDataSourceImplWithPrefs(preferences: getIt()));
    getIt.registerLazySingleton<CoursesDetailsRepo>(
        () => CoursesDetailsImplement(getIt()));

    getIt.registerLazySingleton<CoursesDetailsUseCase>(
        () => CoursesDetailsUseCase(getIt()));
    getIt.registerLazySingleton<CoursesDetailsCubit>(() => CoursesDetailsCubit(
          getIt(),
        ));
  }

  get registerCoursesLessonsDetails {
    getIt.registerLazySingleton<LessonsDetailsDataSources>(
        () => LessonsDetailsWithServer(getIt()));
    // getIt.registerLazySingleton<AdsLocalDataSource>(() => AdsLocalDataSourceImplWithPrefs(preferences: getIt()));
    getIt.registerLazySingleton<LessonsDetailsRepo>(
        () => LessonsDetailsImplement(getIt()));

    getIt.registerLazySingleton<LessonsDetailsUseCase>(
        () => LessonsDetailsUseCase(getIt()));
    getIt.registerLazySingleton<LessonsDetailsCubit>(
        () => LessonsDetailsCubit(getIt()));
    getIt.registerLazySingleton<VideoOperationCubit>(
        () => VideoOperationCubit());
    getIt
        .registerLazySingleton<VimeoVideoCubit>(() => VimeoVideoCubit(getIt()));
  }

  get registerGroupDetails {
    getIt.registerLazySingleton<GroupDetailsDataSources>(
        () => GroupDetailsWithServer(getIt()));
    // getIt.registerLazySingleton<AdsLocalDataSource>(() => AdsLocalDataSourceImplWithPrefs(preferences: getIt()));
    getIt.registerLazySingleton<GroupDetailsRepo>(
        () => GroupDetailsImplement(getIt()));

    getIt.registerLazySingleton<GroupDetailsUseCase>(
        () => GroupDetailsUseCase(getIt()));
    getIt.registerLazySingleton<GroupDetailsCubit>(
        () => GroupDetailsCubit(getIt()));
  }

  get registerGroupLessonsDetails {
    getIt.registerLazySingleton<GroupLessonsDetailsDataSources>(
        () => GroupLessonsWithServer(getIt()));
    // getIt.registerLazySingleton<AdsLocalDataSource>(() => AdsLocalDataSourceImplWithPrefs(preferences: getIt()));
    getIt.registerLazySingleton<GroupLessonsDetailsRepo>(
        () => GroupLessonsDetailsImplement(getIt()));

    getIt.registerLazySingleton<GroupLessonsDetailsUseCase>(
        () => GroupLessonsDetailsUseCase(getIt()));
    getIt.registerLazySingleton<GroupLessonsDetailsCubit>(
        () => GroupLessonsDetailsCubit(getIt()));
  }

  get registerPermission =>
      getIt.registerLazySingleton(() => PermissionManager());
//
  get registerExam {
    getIt.registerLazySingleton<ExamDataSource>(() => ExamWithServer(getIt()));
    getIt.registerLazySingleton<ExamRepo>(() => ExamImplement(getIt()));
    getIt.registerLazySingleton<ExamUseCase>(() => ExamUseCase(getIt()));
    getIt.registerLazySingleton<ExamCubit>(() => ExamCubit(getIt()));
    getIt
        .registerLazySingleton<SubmitExamCubit>(() => SubmitExamCubit(getIt()));

    getIt.registerLazySingleton<ExamQuestionOperationCubit>(
        () => ExamQuestionOperationCubit());

    getIt
        .registerLazySingleton<TestPassedCubit>(() => TestPassedCubit(getIt()));
    getIt.registerLazySingleton<ExamQuestion>(() => ExamQuestion(getIt()));
  }

//
  get registerSubjects {
    getIt.registerLazySingleton<SubjectDataSource>(
        () => SubjectWithServer(getIt()));
    getIt.registerLazySingleton<SubjectRepo>(() => SubjectImplement(getIt()));
    getIt.registerLazySingleton<SubjectUseCase>(() => SubjectUseCase(getIt()));
    getIt.registerLazySingleton<SubjectsCubit>(() => SubjectsCubit(getIt()));
  }

//
  get registerPublicCoursesGroups {
    getIt.registerLazySingleton<PublicGroupsCoursesDataSource>(
        () => PublicGroupsCoursesWithServer(getIt()));
    getIt.registerLazySingleton<PublicGroupsCoursesRepo>(
        () => PublicGroupsCoursesImplement(getIt()));
    getIt.registerLazySingleton<PublicGroupsCoursesUseCase>(
        () => PublicGroupsCoursesUseCase(getIt()));
    getIt.registerLazySingleton<PublicCourseCubit>(
        () => PublicCourseCubit(getIt()));
    getIt.registerLazySingleton<PublicGroupCubit>(
        () => PublicGroupCubit(getIt()));
  }

//
  get registerTeacherDetails {
    getIt.registerLazySingleton<TeacherDetailsDataSource>(
        () => TeacherDetailsWithServer(getIt()));
    getIt.registerLazySingleton<TeacherDetailsRepo>(
        () => TeacherDetailsImplement(getIt()));
    getIt.registerLazySingleton<TeacherDetailsUseCase>(
        () => TeacherDetailsUseCase(getIt()));
    getIt.registerLazySingleton<TeacherDetailsCubit>(
        () => TeacherDetailsCubit(getIt()));
    getIt.registerLazySingleton<ReviewTeacherCubit>(
        () => ReviewTeacherCubit(getIt()));
    getIt.registerLazySingleton<FollowTeacherCubit>(
        () => FollowTeacherCubit(getIt()));
  }

//
  get registerSubscribeCourse {
    getIt.registerLazySingleton<SubscribeCourseDataSource>(
        () => SubscribeCourseWithServer(getIt()));
    getIt.registerLazySingleton<SubscribeCoursesRepo>(
        () => SubscribeCoursesImplement(getIt()));
    getIt.registerLazySingleton<SubscribeCoursesUseCase>(
        () => SubscribeCoursesUseCase(getIt()));
    getIt.registerLazySingleton<SubscribeCourseCubit>(
        () => SubscribeCourseCubit(getIt()));
  }

//
  get registerVideoRate {
    getIt.registerLazySingleton<RateDataSource>(() => RateWithServer(getIt()));
    getIt.registerLazySingleton<RateRepo>(() => RateImplement(getIt()));
    getIt.registerLazySingleton<RateUseCase>(() => RateUseCase(getIt()));
    getIt.registerLazySingleton<RateCubit>(() => RateCubit(getIt()));
  }

//
  get registerCountries {
    getIt.registerLazySingleton<CountryRemoteDatasource>(
        () => CountryWithServer(dioConsumer: getIt()));
    getIt.registerLazySingleton<CountriesRepo>(() => CountryImplement(getIt()));
    getIt.registerLazySingleton<CountriesUseCase>(
        () => CountriesUseCase(getIt()));
    getIt.registerLazySingleton<CountriesCubit>(() => CountriesCubit(getIt()));
    getIt.registerLazySingleton<CityCubit>(() => CityCubit(getIt()));
    getIt.registerLazySingleton<RegionCubit>(() => RegionCubit(getIt()));

  }

  get registerFavoriteVideosGroup {
    getIt.registerLazySingleton<FavoriteVideoGroupDataSource>(
        () => FavoriteVideoGroupWithServer(getIt()));
    // getIt.registerLazySingleton<FavoriteVideoCoursesRepo>(
    //     () => CartWithServer(dioConsumer: getIt()));
    getIt.registerLazySingleton<FavoriteVideoGroupsRepo>(
        () => FavoriteVideoGroupsImplement(getIt()));
    // getIt.registerLazySingleton<FavoriteVideoCoursesRepository>(
    //     () => CartImplementation(cart: getIt(), discount: getIt()));
    getIt.registerLazySingleton<FavoriteVideoGroupsUseCase>(
        () => FavoriteVideoGroupsUseCase(getIt()));
    getIt.registerLazySingleton<FavoriteVideoGroupsCubit>(
        () => FavoriteVideoGroupsCubit(getIt()));
  }

  get registerFavoriteVideosCourses {
    getIt.registerLazySingleton<FavoriteVideoCoursesDataSource>(
        () => FavoriteVideoCoursesWithServer(getIt()));
    // getIt.registerLazySingleton<FavoriteVideoCoursesRepo>(
    //     () => CartWithServer(dioConsumer: getIt()));
    getIt.registerLazySingleton<FavoriteVideoCoursesRepo>(
        () => FavoriteVideoCoursesImplement(getIt()));
    // getIt.registerLazySingleton<FavoriteVideoCoursesRepository>(
    //     () => CartImplementation(cart: getIt(), discount: getIt()));
    getIt.registerLazySingleton<FavoriteVideoCoursesUseCase>(
        () => FavoriteVideoCoursesUseCase(getIt()));
    getIt.registerLazySingleton<FavoriteVideoCoursesCubit>(
        () => FavoriteVideoCoursesCubit(getIt()));
  }

//
  get registerFavoriteUnFavoriteCourseVideo {
    getIt.registerLazySingleton<FavoriteVideoDataSource>(
        () => FavoriteVideoWithServer(getIt()));
    getIt.registerLazySingleton<FavoriteUnFavoriteVideoRepo>(
        () => FavoriteVideoImplement(getIt()));
    getIt.registerLazySingleton<FavoriteUnfavoriteVideoUseCase>(
        () => FavoriteUnfavoriteVideoUseCase(getIt()));
    getIt.registerLazySingleton<FavoriteUnFavoriteVideoCubit>(
        () => FavoriteUnFavoriteVideoCubit(getIt()));
  }

//
  get registerNotification {
    getIt.registerLazySingleton<NotificationDataSource>(
        () => NotificationWithServer(getIt()));
    getIt.registerLazySingleton<NotificationRepo>(
        () => NotificationImplement(getIt()));
    getIt.registerLazySingleton<NotificationUseCase>(
        () => NotificationUseCase(getIt()));

    getIt.registerLazySingleton<NotificationCubit>(
        () => NotificationCubit(getIt()));
    getIt.registerLazySingleton<NotificationOperationCubit>(
        () => NotificationOperationCubit(getIt()));
  }

//   get registerTermsAndCondition {
//     getIt.registerLazySingleton<TermsConditionDataSource>(
//         () => TermsConditionWithServer(getIt()));
//     getIt.registerLazySingleton<TermsConditionRepo>(
//         () => TermsConditionImplementation(getIt()));
//     getIt.registerLazySingleton<TermsConditionUseCase>(
//         () => TermsConditionUseCase(getIt()));
//     getIt.registerLazySingleton<TermsConditionCubit>(
//         () => TermsConditionCubit(getIt()));
//   }
//
  get registerCommentOnLesson {
    getIt.registerLazySingleton<CommentOnLessonsDataSources>(
        () => CommentOnLessonsWithServer(getIt()));
    getIt.registerLazySingleton<CommentOnLessonsRepo>(
        () => CommentOnLessonsImplement(getIt()));
    getIt.registerLazySingleton<CommentOnLessonsUseCase>(
        () => CommentOnLessonsUseCase(getIt()));
    getIt.registerLazySingleton<CommentOnLessonCubit>(
        () => CommentOnLessonCubit(getIt()));
  }

//
//   get registerHelpCenter {
//     getIt.registerLazySingleton<HelpCenterDataSource>(
//         () => HelpCenterWithServer(getIt()));
//     getIt.registerLazySingleton<HelpCenterRepo>(
//         () => HelpCenterImplement(getIt()));
//     getIt.registerLazySingleton<HelpCenterUseCase>(
//         () => HelpCenterUseCase(getIt()));
//     getIt
//         .registerLazySingleton<HelpCenterCubit>(() => HelpCenterCubit(getIt()));
//   }
//
  get registerSubscriptionGroupDetails {
    getIt.registerLazySingleton<SubscriptionDetailsDataSource>(
        () => SubscriptionDetailsWithServer(getIt()));
    getIt.registerLazySingleton<SubscriptionDetailsRepo>(
        () => SubscriptionDetailsImplement(getIt()));
    getIt.registerLazySingleton<SubscriptionDetailsUseCase>(
        () => SubscriptionDetailsUseCase(getIt()));
    getIt.registerLazySingleton<SubscriptionGroupDetailsCubit>(
        () => SubscriptionGroupDetailsCubit(getIt()));

    getIt.registerLazySingleton<SubscriptionCourseDetailsCubit>(
        () => SubscriptionCourseDetailsCubit(getIt()));
  }

  get registerTransaction {
    getIt.registerLazySingleton<UserTransactionDataSource>(
        () => UserTransactionWithServer(getIt()));
    getIt.registerLazySingleton<UserTransactionRepo>(
        () => UserTransactionImplement(getIt()));
    getIt.registerLazySingleton<UserTransactionUseCase>(
        () => UserTransactionUseCase(getIt()));
    getIt.registerLazySingleton<TransactionCubit>(
        () => TransactionCubit(getIt()));
    getIt.registerLazySingleton<BalanceCubit>(() => BalanceCubit(getIt()));
  }

  get registerSchedule {
    getIt.registerLazySingleton<ScheduleDataSource>(
        () => ScheduleWithServer(getIt()));
    getIt.registerLazySingleton<ScheduleRepo>(() => ScheduleImplement(getIt()));
    getIt
        .registerLazySingleton<ScheduleUseCase>(() => ScheduleUseCase(getIt()));
    getIt.registerLazySingleton<ScheduleCubit>(() => ScheduleCubit(getIt()));
  }

//
//
//
//
//
  get registerSubscriptionOfGroup {
    getIt.registerLazySingleton<SubscriptionGroupDataSources>(
        () => SubscriptionGroupWithServer(getIt()));
    getIt.registerLazySingleton<SubscriptionGroupRepo>(
        () => SubscriptionGroupImplement(getIt()));
    getIt.registerLazySingleton<SubscriptionGroupUseCase>(
        () => SubscriptionGroupUseCase(getIt()));
    getIt.registerLazySingleton<SubscriptionGroupCubit>(
        () => SubscriptionGroupCubit(getIt()));
  }

//
//
  get registerSessionsOfGroup {
    getIt.registerLazySingleton<SessionsOfGroupDateSource>(
        () => SessionsOfGroupWithServer(getIt()));
    getIt.registerLazySingleton<SessionsOfGroupRepo>(
        () => SessionsOfGroupImplement(getIt()));
    getIt.registerLazySingleton<SessionsOfGroupUseCase>(
        () => SessionsOfGroupUseCase(getIt()));
    getIt.registerLazySingleton<SessionsOfGroupCubit>(
        () => SessionsOfGroupCubit(getIt()));
    getIt.registerLazySingleton<SessionsOfGroupOperationCubit>(
        () => SessionsOfGroupOperationCubit());

    getIt.registerLazySingleton<TabBarOperationCubit>(
            () => TabBarOperationCubit());


  }

//
//
//
//
//
//
  get registerNearSchoolDetails {
    getIt.registerLazySingleton<NearSchoolDetailsDataSource>(
        () => NearSchoolDetailsWithServer(getIt()));
    getIt.registerLazySingleton<NearSchoolDetailsRepo>(
        () => NearSchoolDetailsImplement(getIt()));
    getIt.registerLazySingleton<NearSchoolDetailsUseCase>(
        () => NearSchoolDetailsUseCase(getIt()));
    // getIt.registerLazySingleton<TransactionCubit>(
    //         () => TransactionCubit(getIt()));
    getIt.registerLazySingleton<NearSchoolDetailsCubit>(
        () => NearSchoolDetailsCubit(getIt()));
  }

//
//
//
  get registerAdsDetails {
    getIt.registerLazySingleton<AdsDetailsDataSource>(
        () => AdsDetailsWithServer(getIt()));
    getIt.registerLazySingleton<AdsDetailsRepo>(
        () => AdsDetailsImplement(getIt()));
    getIt.registerLazySingleton<AdsDetailsUseCase>(
        () => AdsDetailsUseCase(getIt()));
    getIt
        .registerLazySingleton<AdsDetailsCubit>(() => AdsDetailsCubit(getIt()));
  }

  ///////////////////////////////////////////

  get registerMyGrades {
    getIt.registerLazySingleton<MyGradesDataSource>(
        () => MyGradesWithServer(getIt()));
    getIt.registerLazySingleton<MyGradesRepo>(() => MyGradesImplement(getIt()));
    getIt
        .registerLazySingleton<MyGradesUseCase>(() => MyGradesUseCase(getIt()));
    getIt.registerLazySingleton<MyGradesCubit>(() => MyGradesCubit(getIt()));
  }

  get registerStudentTasks {
    getIt.registerLazySingleton<StudentTasksDataSource>(
        () => StudentTasksWithServer(getIt()));
    getIt.registerLazySingleton<StudentTasksRepo>(
        () => StudentTasksImplement(getIt()));
    getIt.registerLazySingleton<StudentTasksUseCase>(
        () => StudentTasksUseCase(getIt()));
    getIt.registerLazySingleton<StudentTasksCubit>(
        () => StudentTasksCubit(getIt()));
  }

  get registerNotes {
    getIt
        .registerLazySingleton<NotesDataSource>(() => NotesWithServer(getIt()));
    getIt.registerLazySingleton<NotesRepo>(() => NotesImplement(getIt()));
    getIt.registerLazySingleton<NotesUseCase>(() => NotesUseCase(getIt()));
    getIt.registerLazySingleton<NotesCubit>(() => NotesCubit(getIt()));
    getIt.registerLazySingleton<NotesOperationCubit>(
        () => NotesOperationCubit());
    getIt.registerLazySingleton<NotesDetailsCubit>(
        () => NotesDetailsCubit(getIt()));
    getIt.registerLazySingleton<NotesBookedUnbookedCubit>(
        () => NotesBookedUnbookedCubit(getIt()));

    getIt.registerLazySingleton<ReserveNoteCubit>(
            () => ReserveNoteCubit(getIt()));
  }
  get registerVideoOfSessionGroup {
    getIt.registerLazySingleton<VideoOfSessionDetailsDataSources>(
        () => VideoOfSessionWithServer(getIt()));
    getIt.registerLazySingleton<VideoOfSessionDetailsRepo>(
        () => VideoOfSessionDetailsImplement(getIt()));
    getIt.registerLazySingleton<VideoOfSessionDetailsUseCase>(
        () => VideoOfSessionDetailsUseCase(getIt()));
    getIt.registerLazySingleton<VideoOfSessionDetailsCubit>(
        () => VideoOfSessionDetailsCubit(getIt()));
    getIt.registerLazySingleton<VideoDataCubit>(() => VideoDataCubit(getIt()));

    getIt.registerLazySingleton<VideoOfSessionOperationCubit>(
        () => VideoOfSessionOperationCubit());
  }

//
  get registerBookingAppointment {
    getIt.registerLazySingleton<BookingAppointmentDataSource>(
        () => BookingAppointmentWithServer(getIt()));
    getIt.registerLazySingleton<BookingAppointmentRepo>(
        () => BookingAppointmentImplement(getIt()));
    getIt.registerLazySingleton<BookingAppointmentUseCase>(
        () => BookingAppointmentUseCase(getIt()));
    getIt.registerLazySingleton<BookingAppointmentCubit>(
        () => BookingAppointmentCubit(getIt()));
  }

//
  get registerPrivateGroups {
    getIt.registerLazySingleton<PrivateGroupsDataSource>(
        () => PrivateGroupsWithServer(getIt()));
    getIt.registerLazySingleton<PrivateGroupsRepo>(
        () => PrivateGroupsImplement(getIt()));
    getIt.registerLazySingleton<PrivateGroupsUseCase>(
        () => PrivateGroupsUseCase(getIt()));
    getIt.registerLazySingleton<PrivateGroupsCubit>(
        () => PrivateGroupsCubit(getIt()));
    getIt.registerLazySingleton<PrivateTeachersGroupCubit>(
        () => PrivateTeachersGroupCubit(getIt()));
    getIt.registerLazySingleton<PrivateGroupsOperationCubit>(
        () => PrivateGroupsOperationCubit());
  }

  //
  get registerParent {
    getIt.registerLazySingleton<ParentDataSource>(
        () => ParentWithServer(getIt()));
    getIt.registerLazySingleton<ParentRepo>(() => ParentImplement(getIt()));
    getIt.registerLazySingleton<ParentUseCase>(() => ParentUseCase(getIt()));
    getIt.registerLazySingleton<ParentsCubit>(() => ParentsCubit(getIt()));
    getIt.registerLazySingleton<StudentRequestParentsCubit>(
        () => StudentRequestParentsCubit(getIt()));
    getIt.registerLazySingleton<ParentsOperationCubit>(
        () => ParentsOperationCubit());
    getIt.registerLazySingleton<AcceptParentsCubit>(
            () => AcceptParentsCubit(getIt()));
    getIt.registerLazySingleton<AddParentsCubit>(
            () => AddParentsCubit(getIt()));
    getIt.registerLazySingleton<CancelParentsCubit>(
            () => CancelParentsCubit(getIt()));
    getIt.registerLazySingleton<RejectParentsCubit>(
            () => RejectParentsCubit(getIt()));
    getIt.registerLazySingleton<ParentsCountCubit>(
            () => ParentsCountCubit(getIt()));
    getIt.registerLazySingleton<ParentsToRequestCubit>(
            () => ParentsToRequestCubit(getIt()));
  }
 get registerParentChildren{
   getIt.registerLazySingleton<ParentChildrenDataSource>(
           () => ParentChildrenWithServer(getIt()));
   getIt.registerLazySingleton<ParentChildrenRepo>(() => ParentChildrenImplement(getIt()));
   getIt.registerLazySingleton<ParentChildrenRuseCase>(() => ParentChildrenRuseCase(getIt()));
   getIt.registerLazySingleton<ParentChildrenCubit>(() =>ParentChildrenCubit(getIt()));
   getIt.registerLazySingleton<ChildrenOperationCubit>(() =>ChildrenOperationCubit());
   getIt.registerLazySingleton<DeleteStudentCubit>(() =>DeleteStudentCubit(getIt()));


  }


  get registerChat {
    getIt.registerLazySingleton<ChatDataSource>(
            () => ChatWithServer(getIt()));
    getIt.registerLazySingleton<ChatRepo>(
            () => ChatImplement(getIt()));
    getIt.registerLazySingleton<ChatUseCase>(
            () => ChatUseCase(getIt()));
    getIt.registerLazySingleton<ChatCubit>(
            () => ChatCubit(getIt()));
    getIt.registerLazySingleton<ChatOfGroupCubit>(
            () => ChatOfGroupCubit(getIt()));
    getIt.registerLazySingleton<ChatGroupMassagesCubit>(
            () => ChatGroupMassagesCubit(getIt()));

    getIt.registerLazySingleton<SendMassageToGroupCubit>(
            () => SendMassageToGroupCubit(getIt()));


    getIt.registerLazySingleton<TeacherToChatCubit>(
            () => TeacherToChatCubit(getIt()));

    getIt.registerLazySingleton<ChatOperationCubit>(() => ChatOperationCubit());

  }
  //
  get registerHomework {
    getIt.registerLazySingleton<HomeWorkDataSource>(
            () => HomeWorkWithServer(getIt()));
    getIt.registerLazySingleton<HomeWorkRepo>(
            () => HomeWorkImplement(getIt()));
    getIt.registerLazySingleton<HomeWorkUseCase>(
            () => HomeWorkUseCase(getIt()));
    getIt.registerLazySingleton<MyHomeworkCubit>(
            () => MyHomeworkCubit(getIt()));
    getIt.registerLazySingleton<HomeworkOperationCubit>(
            () => HomeworkOperationCubit());


  }
  //
  // get registerParent {
  //   getIt.registerLazySingleton<BookingAppointmentDataSource>(
  //           () => BookingAppointmentWithServer(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentRepo>(
  //           () => BookingAppointmentImplement(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentUseCase>(
  //           () => BookingAppointmentUseCase(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentCubit>(
  //           () => BookingAppointmentCubit(getIt()));
  // }
  //
  //
  // get registerParent {
  //   getIt.registerLazySingleton<BookingAppointmentDataSource>(
  //           () => BookingAppointmentWithServer(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentRepo>(
  //           () => BookingAppointmentImplement(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentUseCase>(
  //           () => BookingAppointmentUseCase(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentCubit>(
  //           () => BookingAppointmentCubit(getIt()));
  // }
  //
  // get registerParent {
  //   getIt.registerLazySingleton<BookingAppointmentDataSource>(
  //           () => BookingAppointmentWithServer(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentRepo>(
  //           () => BookingAppointmentImplement(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentUseCase>(
  //           () => BookingAppointmentUseCase(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentCubit>(
  //           () => BookingAppointmentCubit(getIt()));
  // }
  //
  // get registerParent {
  //   getIt.registerLazySingleton<BookingAppointmentDataSource>(
  //           () => BookingAppointmentWithServer(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentRepo>(
  //           () => BookingAppointmentImplement(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentUseCase>(
  //           () => BookingAppointmentUseCase(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentCubit>(
  //           () => BookingAppointmentCubit(getIt()));
  // }
  //
  // get registerParent {
  //   getIt.registerLazySingleton<BookingAppointmentDataSource>(
  //           () => BookingAppointmentWithServer(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentRepo>(
  //           () => BookingAppointmentImplement(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentUseCase>(
  //           () => BookingAppointmentUseCase(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentCubit>(
  //           () => BookingAppointmentCubit(getIt()));
  // }
  // get registerParent {
  //   getIt.registerLazySingleton<BookingAppointmentDataSource>(
  //           () => BookingAppointmentWithServer(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentRepo>(
  //           () => BookingAppointmentImplement(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentUseCase>(
  //           () => BookingAppointmentUseCase(getIt()));
  //   getIt.registerLazySingleton<BookingAppointmentCubit>(
  //           () => BookingAppointmentCubit(getIt()));
  // }
}
