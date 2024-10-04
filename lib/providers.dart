import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/home/presentation/manager/school_cubit.dart';
import 'package:teaching/features/home/presentation/manager/subscription_cubit.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';
import 'package:teaching/features/language/domain/use_cases/language_usecases.dart';
import 'package:teaching/features/on_boarding/presentation/manager/onboarding_manager_cubit.dart';

import 'features/auth/presentation/manager/countries_cubit.dart';
import 'features/home/presentation/manager/ads_cubit.dart';
import 'features/home/presentation/manager/courses_groups_cubit.dart';
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
      create: (context) =>
          ServiceLocator().getIt<CountriesCubit>()..getCountries(),
    ),

    BlocProvider<BottomNavBarOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<BottomNavBarOperationCubit>()),
    BlocProvider<UserCubit>(
        create: (context) => ServiceLocator().getIt<UserCubit>()
          ..getUser()
          ..getToken()),
    BlocProvider<SubscriptionOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubscriptionOperationCubit>()),
    BlocProvider<CoursesGroupOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<CoursesGroupOperationCubit>()),
    // BlocProvider<VideoCubit>(create: (context) => VideoCubit()),
    BlocProvider<CoursesGroupsCubit>(
        create: (context) => ServiceLocator().getIt<CoursesGroupsCubit>()),
    BlocProvider<AdsCubit>(
        create: (context) => ServiceLocator().getIt<AdsCubit>()),
    BlocProvider<NearSchoolCubit>(
        create: (context) => ServiceLocator().getIt<NearSchoolCubit>()),
    BlocProvider<SubscriptionCubit>(
        create: (context) => ServiceLocator().getIt<SubscriptionCubit>()),
    BlocProvider<TeachersOfStudentCubit>(
        create: (context) => ServiceLocator().getIt<TeachersOfStudentCubit>()),
    // BlocProvider<HelpCenterCubit>(
    //     create: (context) =>
    //     ServiceLocator().getIt<HelpCenterCubit>()..getPhoneNumber()),
  ];
}
