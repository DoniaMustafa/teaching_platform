import 'package:easy_localization/easy_localization.dart';

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
    return MaterialApp(
      title: AppStrings().appName,
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: getAppTheme(context),
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      home: OnBoardingScreen(),
    );
  }
}
