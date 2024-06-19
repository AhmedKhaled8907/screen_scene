// import 'package:flutter/material.dart';


// class Routes {
//   static const String splashRoute = "/";
//   static const String loginRoute = "/login";
//   static const String onBoardingRoute = "/onBoardingScreen";
//   static const String registerRoute = "/register";
//   static const String forgotPasswordRoute = "/forgotPassword";
//   static const String mainRoute = "/main";
//   static const String storeDetailsRoute = "/storeDetails";
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => const SplashView());
//         case Routes.onBoardingRoute:
//         return MaterialPageRoute(builder: (_) => const OnBoardingView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => const LoginView());
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_) => const RegisterView());
//       case Routes.forgotPasswordRoute:
//         return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_) => const MainView());
//       case Routes.storeDetailsRoute:
//         return MaterialPageRoute(builder: (_) => const StoreDetailsView());
//       default:
//         return noRoute();
//     }
//   }

//   static Route<dynamic> noRoute() {
//     return MaterialPageRoute(
//       builder: (_) => const NoRouteView(),
//     );
//   }
// }
