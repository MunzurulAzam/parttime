import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/preferences/preference_config.dart';
import 'presentations/app.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
BuildContext get appContext => navigatorKey.currentContext!;
ThemeData appTheme([BuildContext? context]) => Theme.of(context ?? appContext);
AppLocalizations appLanguage([BuildContext? context]) => AppLocalizations.of(context ?? appContext)!;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  await ScreenUtil.ensureScreenSize();
  await initPreferences();

    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black, // status bar color
    systemNavigationBarColor: Colors.black,
  ));

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
