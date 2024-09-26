import 'package:flutter/material.dart';
import 'package:hotel_management/presentations/screens/auth/login_screen.dart';
import 'package:hotel_management/presentations/screens/auth/starter.dart';
import 'package:hotel_management/presentations/screens/home/home_screen.dart';
import 'package:hotel_management/presentations/screens/home/navigation_screen.dart';
import 'package:hotel_management/presentations/screens/trip/trip_screen.dart';
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
      case RouteName.navigationScreen:
        return MaterialPageRoute(
          builder: (_) => const NavigationScreen(),
        );
      case RouteName.staterPage:
        return MaterialPageRoute(
          builder: (_) => const StarterScreen(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
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
