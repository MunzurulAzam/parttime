import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/theme/dark_theme.dart';
import 'package:hotel_management/core/theme/light_theme.dart';
import 'package:hotel_management/core/utils/size_config.dart';
import 'package:hotel_management/providers/main_riverpod_provider.dart';
import '../core/config/routes/app_routes.dart';
import '../core/constants/strings/app_constants.dart';
import '../main.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainNotifierProvider);
    final themeMode = state['themeMode'] as ThemeMode;
    final locale = state['locale'] as Locale;

    return ScreenUtilInit(
      designSize: AppConstant.defaultScreenSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        SizeConfig().init(context);
        return MaterialApp(
          title: AppConstant.appName,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: locale,
          supportedLocales: const [
            Locale('en', ''),
            Locale('bn', ''),
          ],
          navigatorKey: navigatorKey,
          initialRoute: RouteName.splash,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
