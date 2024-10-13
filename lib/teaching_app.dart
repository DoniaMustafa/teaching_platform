import 'package:easy_localization/easy_localization.dart';
import 'package:teaching/features/auth/presentation/pages/choose_role_screen.dart';
import 'package:teaching/features/auth/presentation/pages/login_screen.dart';

import '../core/export/export.dart';

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
      ),
    );
  }

  _buildApp(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          title: AppStrings().appName,
          navigatorKey: navigatorKey,
          onGenerateRoute: RouteGenerator.getRoute,
          theme: getAppTheme(context),
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          // home: LoginScreen(),
        );
      },
    );
  }
}
