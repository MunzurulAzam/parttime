import 'package:flutter/material.dart';
import 'package:hotel_management/data/models/details/villa_details.dart';
import 'package:hotel_management/presentations/screens/auth/login_screen.dart';
import 'package:hotel_management/presentations/screens/auth/sign_up_screen.dart';
import 'package:hotel_management/presentations/screens/auth/starter.dart';
import 'package:hotel_management/presentations/screens/details_page/details_screen.dart';
import 'package:hotel_management/presentations/screens/auth/login_screen.dart';
import 'package:hotel_management/presentations/screens/auth/sign_up_screen.dart';
import 'package:hotel_management/presentations/screens/auth/starter.dart';
import 'package:hotel_management/presentations/screens/home/home_screen.dart';
import 'package:hotel_management/presentations/screens/home/navigation_screen.dart';
import 'package:hotel_management/presentations/screens/payment_screen/payment_screen.dart';
import 'package:hotel_management/presentations/screens/profile/edit_profile.dart';
import 'package:hotel_management/presentations/screens/trip/trip_screen.dart';
import '../../../data/models/home/villa_model.dart';
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
      case RouteName.homeScreen:
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
      case RouteName.editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
        );
      case RouteName.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case RouteName.detailsScreen:
        final arg = settings.arguments as VillaModel;
        return MaterialPageRoute(
          builder: (_) =>  DetailsScreen(model: arg),
        );
      case RouteName.paymentScreen:
        final arg = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>  PaymentScreen(villaId: arg,),
        );
<<<<<<< HEAD
=======
      case RouteName.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
        );
>>>>>>> 90d7495 (villa details done and payment implemented)
      // case RouteName.signUp:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignUpScreen(),
      //   );
      // case RouteName.editProfile:
      //   return MaterialPageRoute(
      //     builder: (_) => const EditProfileScreen(),
      //   );
      // case RouteName.login:
      //   return MaterialPageRoute(
      //     builder: (_) => const LogInScreen(),
      //   );
      // case RouteName.signUp:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignUpScreen(),
      //   );
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
