import 'package:get_it/get_it.dart';
import 'package:teaching/features/auth/data/data_sources/user_local_datasource.dart';
import 'package:teaching/features/auth/data/data_sources/user_remote_datasource.dart';
import 'package:teaching/features/auth/data/repositories/user_repo_impl.dart';
import 'package:teaching/features/auth/domain/repositories/user_repo.dart';
import 'package:teaching/features/auth/domain/use_cases/user_usecases.dart';
import 'package:teaching/features/home/data/data_sources/student/ads_data_source.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_groups_data_source.dart';
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
import 'package:teaching/features/on_boarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:teaching/features/on_boarding/data/repositories/onboarding_repo_impl.dart';
import 'package:teaching/features/on_boarding/domain/repositories/onboarding_repo.dart';
import 'package:teaching/features/on_boarding/domain/usecase/onborading_usecases.dart';
import 'package:teaching/features/on_boarding/presentation/manager/onboarding_manager_cubit.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

import 'core/export/export.dart';
import 'core/network/impl/dio_impl/dio-consumer.dart';
import 'core/network/impl/dio_impl/dio_interceptors.dart';
import 'features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'features/bottom_nav_bar/presentaion/manager/onboading_operation_cubit.dart';
import 'features/home/data/data_sources/student/teachers_of_student_data_source.dart';
import 'features/home/data/repositories/student/courses_groups_implement.dart';
import 'features/home/domain/repositories/student/courses_groups_repo.dart';
import 'features/home/domain/use_cases/student/courses_groups_use_case.dart';
import 'features/home/presentation/manager/courses_groups_cubit.dart';
import 'features/language/data/data_sources/language_local_datasource.dart';
import 'features/language/data/repositories/language_repo_impl.dart';
import 'features/language/domain/repositories/language_repo.dart';
import 'features/language/domain/use_cases/language_usecases.dart';
import 'features/language/presentation/managers/language_cubit/language_cubit.dart';

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
    // await registerPrefs;
    registerUser;
    registerError;
    registerNetwork;
    registerTeachersOfStudent;
    registerSubscription;
    registerAds;
    registerNearSchool;
    registerCoursesGroups;
    registerOnboarding;
    // registerCategories;
    // registerServices;
    // registerInfo;
    // registerProducts;
    // registerSubServices;
    // registerSubServicesDetails;
    // registerCart;
    // registerBookingServices;
    // registerOffers;
    // registerTermsAndCondition;
    // registerOrders;
    // registerHelpCenter;
    // registerAccount;
    // registerProductDetails;
    // registerSettings;
    // registerConsultation;
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

  get registerError {
    getIt.registerLazySingleton<ErrorCubit>(() => ErrorCubit());
    // getIt.registerLazySingleton<LanguageRepo>(
    //     () => LanguageRepoImpl(languageLocalDataSource: getIt()));
    // getIt.registerLazySingleton<LanguageUseCases>(
    //     () => LanguageUseCases(languageRepo: getIt()));
    getIt.registerLazySingleton<BottomNavBarOperationCubit>(
        () => BottomNavBarOperationCubit());
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

  get registerCoursesGroups {
    getIt.registerLazySingleton<CoursesGroupsDataSource>(
        () => CoursesGroupsWithServer(getIt()));
    getIt.registerLazySingleton<CoursesGroupsRepo>(
        () => CoursesGroupsImplement(getIt()));
    getIt.registerLazySingleton<CoursesGroupsUseCase>(
        () => CoursesGroupsUseCase(getIt()));
    getIt.registerLazySingleton<CoursesGroupsCubit>(
        () => CoursesGroupsCubit(getIt()));
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
        .registerLazySingleton<UserUsecases>(() => UserUsecases(repo: getIt()));
    getIt.registerLazySingleton<UserCubit>(
        () => UserCubit(userUsecases: getIt()..getUser()));
    // getIt.registerLazySingleton<EditOperationCubit>(() => EditOperationCubit());
  }
//

//
//   get registerOnboarding {
//     getIt.registerLazySingleton<OnBoardingLocalDataSource>(() =>
//         OnBoardingLocalDataSourceImplWithPrefs(sharedPreferences: getIt()));
//     getIt.registerLazySingleton<OnBoardingRepo>(
//         () => OnBoardingRepoImpl(onBoardingLocalDataSource: getIt()));
//     getIt.registerLazySingleton<OnBoardingUsesCases>(
//         () => OnBoardingUsesCases(onBoardingRepo: getIt()));
//     getIt.registerLazySingleton<OnboardingManagerCubit>(
//         () => OnboardingManagerCubit(onBoardingUsesCases: getIt()));
//   }
//
//   get registerAds {
//     getIt.registerLazySingleton<AdsRemoteDataSource>(
//         () => AdsRemoteDataSourceImpl(dioConsumer: getIt()));
//     // getIt.registerLazySingleton<AdsLocalDataSource>(() => AdsLocalDataSourceImplWithPrefs(preferences: getIt()));
//     getIt.registerLazySingleton<AdsRepo>(
//         () => AdsRepoImpl(adsRemoteDataSource: getIt()));
//
//     getIt.registerLazySingleton<AdsUseCases>(
//         () => AdsUseCases(adsRepo: getIt()));
//     getIt.registerLazySingleton<AdsCubit>(() => AdsCubit(adsUseCases: getIt()));
//   }
//

//
//   get registerPermission =>
//       getIt.registerLazySingleton(() => PermissionManager());
//
//   get registerCategories {
//     getIt.registerLazySingleton<CategoriesRemoteDatasource>(
//         () => CategoriesRemoteDataSourceImpl(dioConsumer: getIt()));
//     getIt.registerLazySingleton<CategoriesRepo>(
//         () => CategoriesRepoImpl(categoriesRemoteDatasource: getIt()));
//     getIt.registerLazySingleton<CategoriesUseCases>(
//         () => CategoriesUseCases(categoriesRepo: getIt()));
//     getIt.registerLazySingleton<CategoriesCubit>(
//         () => CategoriesCubit(categoriesUseCases: getIt()));
//   }
//
//   get registerServices {
//     getIt.registerLazySingleton<ServicesRemoteDatasource>(
//         () => ServicesRemoteDataSourceImpl(dioConsumer: getIt()));
//     getIt.registerLazySingleton<ServicesRepo>(
//         () => ServicesRepoImpl(servicesRemoteDatasource: getIt()));
//     getIt.registerLazySingleton<ServicesUseCases>(
//         () => ServicesUseCases(servicesRepo: getIt()));
//   }
//
//   get registerSubServices {
//     getIt.registerLazySingleton<SubServicesRemoteDataSource>(
//         () => SubServicesRemoteDataSourceImpl(dioConsumer: getIt()));
//     getIt.registerLazySingleton<SubServicesRepo>(
//         () => SubServicesRepoImpl(subServicesRemoteDataSource: getIt()));
//     getIt.registerLazySingleton<SubServicesUseCase>(
//         () => SubServicesUseCase(subServicesRepo: getIt()));
//   }
//
//   get registerSubServicesDetails {
//     getIt.registerLazySingleton<SubServicesDetailsDataSources>(
//         () => SubServicesDetailsDataSourceImpl(dioConsumer: getIt()));
//     getIt.registerLazySingleton<SubServicesDetailsRepo>(
//         () => SubServicesDetailsRepoImpl(servicesDetailsDataSources: getIt()));
//     getIt.registerLazySingleton<SubServicesDetailsUseCase>(
//         () => SubServicesDetailsUseCase(subServicesDetailsRepo: getIt()));
//   }
//
//   get registerBookingServices {
//     getIt.registerLazySingleton<BookingServiceRemoteDataSource>(
//         () => BookingServiceRemoteDataSourceImpl(dioConsumer: getIt()));
//     getIt.registerLazySingleton<BookingServiceRepo>(
//         () => BookingServiceRepoImpl(bookingServiceRemoteDataSource: getIt()));
//     getIt.registerLazySingleton<BookingServiceUseCase>(
//         () => BookingServiceUseCase(bookingServiceRepo: getIt()));
//   }
//
//   get registerInfo {
//     getIt.registerLazySingleton<InfoRemoteDataSource>(
//         () => InfoRemoteDataSourceImpl(dioConsumer: getIt<DioConsumer>()));
//     getIt.registerLazySingleton<InfoRepo>(() =>
//         InfoRepoImpl(infoRemoteDataSource: getIt<InfoRemoteDataSource>()));
//     getIt.registerLazySingleton<InfoUseCases>(
//         () => InfoUseCases(infoRepo: getIt<InfoRepo>()));
//   }
//
//   get registerProducts {
//     getIt.registerLazySingleton<ProductRemoteDataSource>(
//         () => ProductRemoteDataSourceImpl(dioConsumer: getIt()));
//     getIt.registerLazySingleton<ProductRepo>(
//         () => ProductRepoImpl(productRemoteDataSource: getIt()));
//     getIt.registerLazySingleton<ProductUseCases>(
//         () => ProductUseCases(productRepo: getIt()));
//     getIt.registerLazySingleton<ProductCubit>(
//         () => ProductCubit(productUseCases: getIt()));
//   }
//
//   get registerCart {
//     getIt.registerLazySingleton<CartDataSource>(
//         () => CartWithServer(dioConsumer: getIt()));
//     getIt.registerLazySingleton<PutDiscountDataSource>(
//         () => CartWithServer(dioConsumer: getIt()));
//     getIt.registerLazySingleton<CartRepository>(
//         () => CartImplementation(cart: getIt(), discount: getIt()));
//     getIt.registerLazySingleton<PutDiscountRepository>(
//         () => CartImplementation(cart: getIt(), discount: getIt()));
//     getIt.registerLazySingleton<CartUseCase>(
//         () => CartUseCase(repo: getIt(), discount: getIt()));
//     getIt.registerLazySingleton<CartCubit>(() => CartCubit(useCase: getIt()));
//     getIt.registerLazySingleton<PutDiscountCubit>(
//         () => PutDiscountCubit(useCase: getIt()));
//
//     getIt.registerLazySingleton<CartOperationCubit>(
//         () => CartOperationCubit(getIt()));
//   }
//
//   get registerOrders {
//     getIt.registerLazySingleton<MyOrdersDataSource>(
//         () => MyOrdersWithServer(dioConsumer: getIt()));
//     getIt.registerLazySingleton<MyOrdersRepository>(
//         () => MyOrdersImplementation(order: getIt()));
//     getIt.registerLazySingleton<MyOrdersUseCase>(
//         () => MyOrdersUseCase(repo: getIt()));
//     getIt.registerLazySingleton<MyOrdersCubit>(
//         () => MyOrdersCubit(useCase: getIt()));
//   }
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
