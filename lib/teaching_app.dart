import 'package:easy_localization/easy_localization.dart';
import 'package:teaching/features/auth/presentation/pages/choose_role_screen.dart';
import 'package:teaching/features/auth/presentation/pages/login_screen.dart';
import 'package:teaching/features/bottom_nav_bar/presentaion/page/bottom_nav_bar_screen.dart';
import 'package:teaching/providers.dart';
import '../core/export/export.dart';
import 'config/themes/themes.dart';
import 'features/on_boarding/presentation/pages/on_boarding_creen.dart';

class TeachingApp extends StatelessWidget {
  const TeachingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviders.providers,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            AppService().hideKeyboard;
          },
          child: _buildApp(context),
        ));
  }

  _buildApp(BuildContext context) {
    return MaterialApp(
      title: AppStrings().appName,
      navigatorKey: AppService.navigatorKey,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: getAppTheme(context),
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      // home: OnBoardingScreen(),
    );
  }
}
