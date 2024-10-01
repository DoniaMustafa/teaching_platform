import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:teaching/features/home/presentation/manager/school_cubit.dart';
import 'package:teaching/features/home/presentation/manager/subscription_cubit.dart';
import 'package:teaching/features/home/presentation/manager/teachers_of_student_cubit.dart';

import 'features/home/presentation/manager/ads_cubit.dart';
import 'features/home/presentation/manager/courses_groups_cubit.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<LanguageCubit>(
        create: (context) =>
            ServiceLocator().getIt<LanguageCubit>()..getSavedLanguage()),
    BlocProvider<ErrorCubit>(
        create: (context) => ServiceLocator().getIt<ErrorCubit>()),
    BlocProvider<BottomNavBarOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<BottomNavBarOperationCubit>()),
    BlocProvider<UserCubit>(
        create: (context) => ServiceLocator().getIt<UserCubit>()),
    // BlocProvider<EditOperationCubit>(
    //     create: (context) => ServiceLocator().getIt<EditOperationCubit>()),
    // BlocProvider<SettingCubit>(
    //     create: (context) => ServiceLocator().getIt<SettingCubit>()),
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
