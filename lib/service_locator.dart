import 'package:get_it/get_it.dart';
import 'package:teaching/core/managers/file_magager_cubit.dart';
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
import 'package:teaching/features/auth/domain/use_cases/education_type_use_case.dart';
import 'package:teaching/features/auth/domain/use_cases/user_usecases.dart';
import 'package:teaching/features/auth/presentation/manager/countries/countries_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/education_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/subject/subject_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_operation_cubit.dart';
import 'package:teaching/features/course/courses_details/data/data_sources/subscribe_course_data_source.dart';
import 'package:teaching/features/course/courses_details/data/repositories/courses_details_implement.dart';
import 'package:teaching/features/course/courses_details/data/repositories/subscribe_courses_implement.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/courses_details_repo.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/subscribe_courses_repo.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/courses_details_use_case.dart';
import 'package:teaching/features/course/courses_details/domain/use_cases/subscribe_courses_use_case.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/subscribe_course_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/favorite_video_data_source.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/rate_data_source.dart';
import 'package:teaching/features/course/courses_lessons_details/data/repositories/favorite_video_implement.dart';
import 'package:teaching/features/course/courses_lessons_details/data/repositories/rate_implement.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/favorite_unfavorite_video_repo.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/rate_repo.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/favorite_unfavorite_video_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/rate_uescase.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/attachments_operation_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/exam_operation_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/follow_unfollow_video_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/rate_cubit.dart';
import 'package:teaching/features/courses_groups/data/data_sources/public_groups_courses_Data_source.dart';
import 'package:teaching/features/courses_groups/data/data_sources/subject_Data_source.dart';
import 'package:teaching/features/courses_groups/data/repositories/public_groups_courses_implement.dart';
import 'package:teaching/features/courses_groups/data/repositories/subject_implement.dart';
import 'package:teaching/features/courses_groups/domain/repositories/subject_repo.dart';
import 'package:teaching/features/courses_groups/domain/use_cases/subject_use_case.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/public_course_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/subjects_cubit.dart';
import 'package:teaching/features/exam/data/data_sources/exam_data_source.dart';
import 'package:teaching/features/exam/data/repositories/exam_implement.dart';
import 'package:teaching/features/exam/domain/repositories/exam_repo.dart';
import 'package:teaching/features/exam/domain/use_cases/exam_use_case.dart';
import 'package:teaching/features/exam/presentation/manager/exam_cubit.dart';
import 'package:teaching/features/favorite/data/data_sources/favorite_video_courses_data_source.dart';
import 'package:teaching/features/favorite/data/repositories/favorite_video_courses_implement.dart';
import 'package:teaching/features/favorite/domain/repositories/favorite_video_courses_repo.dart';
import 'package:teaching/features/favorite/domain/use_cases/favorite_video_courses_use_case.dart';
import 'package:teaching/features/favorite/presentation/manager/favorite_video_courses_cubit.dart';
import 'package:teaching/features/group/group_lessons_details/data/data_sources/group_lessons_details_data_sources.dart';
import 'package:teaching/features/group/group_lessons_details/data/repositories/group_lessons_details_implement.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/group_lessons_details_repo.dart';
import 'package:teaching/features/group/group_lessons_details/domain/use_cases/group_lessons_details_use_case.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/group_lessons_details/group_lessons_details_cubit.dart';
import 'package:teaching/features/group/groups_details/data/data_sources/group_lessons_details_data_sources.dart';
import 'package:teaching/features/group/groups_details/data/repositories/group_details_implement.dart';
import 'package:teaching/features/group/groups_details/domain/repositories/group_details_repo.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/home/data/data_sources/student/ads_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/near_school_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/subscriptions_data_source.dart';
import 'package:teaching/features/home/data/repositories/student/ads_implement.dart';
import 'package:teaching/features/home/data/repositories/student/near_school_implement.dart';
import 'package:teaching/features/home/data/repositories/student/subscription_implement.dart';
import 'package:teaching/features/home/data/repositories/student/teacher_of_student_implement.dart';
import 'package:teaching/features/home/domain/repositories/student/ads_repo.dart';
import 'package:teaching/features/home/domain/repositories/student/near_school_repo.dart';
import 'package:teaching/features/home/domain/repositories/student/subscription_repo.dart';
import 'package:teaching/features/home/domain/repositories/student/teacher_of_student_repo.dart';
import 'package:teaching/features/home/domain/use_cases/student/ads_use_case.dart';
import 'package:teaching/features/home/domain/use_cases/student/near_school_use_case.dart';
import 'package:teaching/features/home/domain/use_cases/student/subscription_use_case.dart';
import 'package:teaching/features/home/domain/use_cases/student/teacher_of_student_use_case.dart';
import 'package:teaching/features/home/presentation/manager/ads_cubit.dart';
import 'package:teaching/features/home/presentation/manager/school_cubit.dart';
import 'package:teaching/features/home/presentation/manager/subscription_cubit.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/lessons_details_data_sources.dart';
import 'package:teaching/features/course/courses_lessons_details/data/repositories/lessons_details_implement.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/use_cases/lessons_details_use_case.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/language/presentation/managers/language_oepration_cubit/language_oepration_cubit.dart';
import 'package:teaching/features/on_boarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:teaching/features/on_boarding/data/repositories/onboarding_repo_impl.dart';
import 'package:teaching/features/on_boarding/domain/repositories/onboarding_repo.dart';
import 'package:teaching/features/on_boarding/domain/usecase/onborading_usecases.dart';
import 'package:teaching/features/on_boarding/presentation/manager/onboarding_manager_cubit.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/data/data_sources/teacher_details_data_source.dart';
import 'package:teaching/features/teacher/teacher_details/data/repositories/teacher_details_implement.dart';
import 'package:teaching/features/teacher/teacher_details/domain/repositories/teacher_details_repo.dart';
import 'package:teaching/features/teacher/teacher_details/domain/use_cases/teacher_details_use_case.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/follow_teacher_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/review_teacher_cubit.dart';
import 'package:teaching/features/teacher/teacher_details/presentation/manager/teacher_details_cubit.dart';

import 'core/export/export.dart';
import 'core/network/impl/dio_impl/dio-consumer.dart';
import 'core/network/impl/dio_impl/dio_interceptors.dart';
import 'core/permission_handler.dart';
import 'features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'features/bottom_nav_bar/presentaion/manager/onboading_operation_cubit.dart';
import 'features/course/courses_details/data/data_sources/courses_details_data_source.dart';
import 'features/courses_groups/domain/repositories/public_groups_courses_repo.dart';
import 'features/courses_groups/domain/use_cases/public_groups_courses_use_case.dart';
import 'features/courses_groups/presentation/manager/public_group_cubit.dart';
import 'features/home/data/data_sources/student/groups_data_source.dart';
import 'features/home/data/data_sources/student/teachers_of_student_data_source.dart';
import 'features/home/data/repositories/student/courses_groups_implement.dart';
import 'features/home/data/repositories/student/groups_implement.dart';
import 'features/home/domain/repositories/student/courses_repo.dart';
import 'features/home/domain/repositories/student/groups_repo.dart';
import 'features/home/domain/use_cases/student/courses_groups_use_case.dart';
import 'features/home/domain/use_cases/student/groups_use_case.dart';
import 'features/home/presentation/manager/courses_cubit.dart';
import 'features/home/presentation/manager/groups_cubit.dart';
import 'features/language/data/data_sources/language_local_datasource.dart';
import 'features/language/data/repositories/language_repo_impl.dart';
import 'features/language/domain/repositories/language_repo.dart';
import 'features/language/domain/use_cases/language_usecases.dart';
import 'features/language/presentation/managers/language_cubit/language_cubit.dart';
import 'features/course/courses_lessons_details/domain/repositories/lessons_details_repo.dart';

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
    registerFavoriteVideos;
    // registerTermsAndCondition;
    registerFavoriteUnFavoriteCourseVideo;
    // registerHelpCenter;
    // registerAccount;
    // registerProductDetails;
    // registerSettings;
    registerEducation;
    //
    // getIt.registerFactory<LanguageLocalDataSource>(() => LanguageImplWithPrefs(sharedPreferences: getIt()));
    // getIt.registerFactory<LanguageRepo>(() => LanguageRepoImpl(languageLocalDataSource: getIt()));
    // getIt.registerFactory<LanguageUseCases>(() => LanguageUseCases(languageRepo: getIt()));
    // getIt.registerFactory<LanguageCubit>(() => LanguageCubit(languageUseCases: getIt()));
    //
    //
  }

//   get registerPrefs async {
// ;
//   }

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
    getIt.registerFactory<LanguageOperationCubit>(() => LanguageOperationCubit());



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
    getIt.registerLazySingleton<ChatOperationCubit>(() => ChatOperationCubit());

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
    getIt.registerLazySingleton<CoursesDetailsCubit>(
        () => CoursesDetailsCubit(getIt()));
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
    getIt.registerLazySingleton<ExamDataSource>(
        () => ExamWithServer( getIt()));
    getIt.registerLazySingleton<ExamRepo>(
        () => ExamImplement(getIt()));
    getIt.registerLazySingleton<ExamUseCase>(
        () => ExamUseCase( getIt()));
    getIt.registerLazySingleton<ExamCubit>(
        () => ExamCubit( getIt()));
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
  }

  get registerFavoriteVideos {
    getIt.registerLazySingleton<FavoriteVideoCoursesDataSource>(
        () => FavoriteVideoCoursesWithServer( getIt()));
    // getIt.registerLazySingleton<FavoriteVideoCoursesRepo>(
    //     () => CartWithServer(dioConsumer: getIt()));
    getIt.registerLazySingleton<FavoriteVideoCoursesRepo>(
        () => FavoriteVideoCoursesImplement(getIt()));
    // getIt.registerLazySingleton<FavoriteVideoCoursesRepository>(
    //     () => CartImplementation(cart: getIt(), discount: getIt()));
    getIt.registerLazySingleton<FavoriteVideoCoursesUseCase>(
        () => FavoriteVideoCoursesUseCase(getIt()));
    getIt.registerLazySingleton<FavoriteVideoCoursesCubit>(() => FavoriteVideoCoursesCubit( getIt()));
    // getIt.registerLazySingleton<PutDiscountCubit>(
    //     () => PutDiscountCubit(useCase: getIt()));
    //
    // getIt.registerLazySingleton<CartOperationCubit>(
    //     () => CartOperationCubit(getIt()));
  }
//
  get registerFavoriteUnFavoriteCourseVideo {
    getIt.registerLazySingleton<FavoriteVideoDataSource>(
        () => FavoriteVideoWithServer( getIt()));
    getIt.registerLazySingleton<FavoriteUnFavoriteVideoRepo>(
        () => FavoriteVideoImplement( getIt()));
    getIt.registerLazySingleton<FavoriteUnfavoriteVideoUseCase>(
        () => FavoriteUnfavoriteVideoUseCase( getIt()));
    getIt.registerLazySingleton<FavoriteUnFavoriteVideoCubit>(
        () => FavoriteUnFavoriteVideoCubit( getIt()));
  }
//
//   get registerOffers {
//     getIt.registerLazySingleton<OffersRemoteDatasource>(
//         () => OffersWithServer(dioConsumer: getIt()));
//     getIt.registerLazySingleton<OffersUseCases>(
//         () => OffersUseCases(repo: getIt()));
//     getIt.registerLazySingleton<OffersRepo>(
//         () => OffersRepoImpl(offer: getIt()));
//     getIt.registerLazySingleton<OffersCubit>(() => OffersCubit(getIt()));
//     getIt.registerLazySingleton<OfferDetailsCubit>(
//         () => OfferDetailsCubit(getIt()));
//   }
//
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
//   get registerAccount {
//     getIt.registerLazySingleton<AccountOperationCubit>(
//         () => AccountOperationCubit(getIt()));
//   }
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
//   get registerSettings {
//     getIt.registerLazySingleton<SettingsDataSource>(
//         () => SettingsWithServer(getIt()));
//     getIt.registerLazySingleton<SettingsRepo>(() => SettingsImplement(getIt()));
//     getIt
//         .registerLazySingleton<SettingsUseCase>(() => SettingsUseCase(getIt()));
//     getIt.registerLazySingleton<SettingCubit>(() => SettingCubit(getIt()));
//   }
}
