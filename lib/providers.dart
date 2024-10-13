import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/manager/countries/countries_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/education_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/program/prgram_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/stage/stage_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/education/subject/subject_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_operation_cubit.dart';
import 'package:teaching/features/course/courses_details/presentation/manager/courses_details/courses_details_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/group/group_lessons_details/presentation/manager/group_lessons_details/group_lessons_details_cubit.dart';
import 'package:teaching/features/group/groups_details/presentation/manager/group_details/group_details_cubit.dart';
import 'package:teaching/features/home/presentation/manager/school_cubit.dart';
import 'package:teaching/features/home/presentation/manager/subscription_cubit.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/on_boarding/presentation/manager/onboarding_manager_cubit.dart';
import 'core/managers/file_magager_cubit.dart';
import 'features/courses_groups/presentation/manager/public_coures_group_cubit.dart';
import 'features/home/presentation/manager/ads_cubit.dart';
import 'features/home/presentation/manager/groups_cubit.dart';
import 'features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<LanguageCubit>(
        create: (context) => ServiceLocator().getIt<LanguageCubit>()),
    BlocProvider<ErrorCubit>(
        create: (context) => ServiceLocator().getIt<ErrorCubit>()),
    BlocProvider<OnboardingManagerCubit>(
        create: (context) => ServiceLocator().getIt<OnboardingManagerCubit>()),
    BlocProvider<CountriesCubit>(
      create: (context) => ServiceLocator().getIt<CountriesCubit>(),
    ),

    BlocProvider<BottomNavBarOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<BottomNavBarOperationCubit>()),
    BlocProvider<UserCubit>(
      create: (context) => ServiceLocator().getIt<UserCubit>()
        ..getUser()
        ..getToken(),
      lazy: false,
    ),
    BlocProvider<SubscriptionOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubscriptionOperationCubit>()),
    BlocProvider<GroupsCubit>(
      create: (context) => ServiceLocator().getIt<GroupsCubit>(),
    ),
    BlocProvider<CoursesGroupOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<CoursesGroupOperationCubit>()),
    // BlocProvider<VideoCubit>(create: (context) => VideoCubit()),
    BlocProvider<CoursesCubit>(
        create: (context) => ServiceLocator().getIt<CoursesCubit>()),
    BlocProvider<AdsCubit>(
        create: (context) => ServiceLocator().getIt<AdsCubit>()),
    BlocProvider<NearSchoolCubit>(
        create: (context) => ServiceLocator().getIt<NearSchoolCubit>()),
    BlocProvider<SubscriptionCubit>(
        create: (context) => ServiceLocator().getIt<SubscriptionCubit>()),
    BlocProvider<TeachersOfStudentCubit>(
        create: (context) => ServiceLocator().getIt<TeachersOfStudentCubit>()),
    BlocProvider<EducationCubit>(
        create: (context) =>
            ServiceLocator().getIt<EducationCubit>()..getEducationType()),

    BlocProvider<SubjectCubit>(
        create: (context) => ServiceLocator().getIt<SubjectCubit>()),

    BlocProvider<FileManagerCubit>(
        create: (context) => ServiceLocator().getIt<FileManagerCubit>()),

    BlocProvider<ProgramCubit>(
        create: (context) => ServiceLocator().getIt<ProgramCubit>()),
    BlocProvider<StageCubit>(
        create: (context) => ServiceLocator().getIt<StageCubit>()),

    BlocProvider<ChatOperationCubit>(
        create: (context) => ServiceLocator().getIt<ChatOperationCubit>()),
    BlocProvider<CoursesDetailsCubit>(
        create: (context) => ServiceLocator().getIt<CoursesDetailsCubit>()),
    BlocProvider<LessonsDetailsCubit>(
        create: (context) => ServiceLocator().getIt<LessonsDetailsCubit>()),
    BlocProvider<GroupDetailsCubit>(
        create: (context) => ServiceLocator().getIt<GroupDetailsCubit>()),
    BlocProvider<GroupLessonsDetailsCubit>(
        create: (context) =>
            ServiceLocator().getIt<GroupLessonsDetailsCubit>()),
    BlocProvider<SubjectsCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubjectsCubit>()),
    BlocProvider<PublicCouresGroupCubit>(
        create: (context) =>
            ServiceLocator().getIt<PublicCouresGroupCubit>()),


    ];
}
