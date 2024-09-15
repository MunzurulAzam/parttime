import 'package:flutter/material.dart';
import 'package:hotel_management/presentations/screens/home/home_screen.dart';
import '../../../presentations/screens/splash/splash_screen.dart';
import '../../exceptions/route_exceptions.dart';
part 'route_name.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = RouteName.splash;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      ///initialRoute -> splash screen
      case initial:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      // case Routes.home:
      //   final AppArguments arguments = settings.arguments as AppArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => ApplicationConfirmation(
      //       creditApplicationInformation: arguments.creditApplicationInformation,
      //       package: arguments.package,
      //     ),
      //   );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
