// // import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:movies_app/core/services/services_locator.dart';
// import 'package:movies_app/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
// import 'package:movies_app/movies/presentation/controller/similar_movies_bloc/similar_movies_bloc.dart';
// import 'package:movies_app/movies/presentation/views/movie_details_view/movie_details_view.dart';
// import 'package:movies_app/movies/presentation/views/movie_view/movies_view.dart';

// abstract class AppRouter {
//   static const kMovieView = '/';
//   static const kBookDetailsView = '/MovieDetailsView';
//   // static const kSearchView = '/searchView';

//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: kMovieView,
//         builder: (context, state) => const MoviesView(),
//       ),
//       GoRoute(
//         path: kBookDetailsView,
//         builder: (context, state) => MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) => sl<MovieDetailsBloc>()
//                 ..add(
//                   GetMovieDetailsEvent(
//                     movieId: state.extra as int,
//                   ),
//                 ),
//               lazy: false,
//             ),
//             BlocProvider(
//               create: (context) => sl<SimilarMoviesBloc>()
//                 ..add(
//                   GetSimilarMoviesEvent(
//                     movieId: state.extra as int,
//                   ),
//                 ),
//               lazy: false,
//             ),
//           ],
//           child: MovieDetailView(
//             id: state.extra as int,
//           ),
//         ),
//       ),
//     ],
//   );
// }



// // class Routes {
// //   static const String splashRoute = "/";
// //   static const String loginRoute = "/login";
// //   static const String onBoardingRoute = "/onBoardingScreen";
// //   static const String registerRoute = "/register";
// //   static const String forgotPasswordRoute = "/forgotPassword";
// //   static const String mainRoute = "/main";
// //   static const String storeDetailsRoute = "/storeDetails";
// // }

// // class RouteGenerator {
// //   static Route<dynamic> getRoute(RouteSettings settings) {
// //     switch (settings.name) {
// //       case Routes.splashRoute:
// //         return MaterialPageRoute(builder: (_) => const SplashView());
// //         case Routes.onBoardingRoute:
// //         return MaterialPageRoute(builder: (_) => const OnBoardingView());
// //       case Routes.loginRoute:
// //         return MaterialPageRoute(builder: (_) => const LoginView());
// //       case Routes.registerRoute:
// //         return MaterialPageRoute(builder: (_) => const RegisterView());
// //       case Routes.forgotPasswordRoute:
// //         return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
// //       case Routes.mainRoute:
// //         return MaterialPageRoute(builder: (_) => const MainView());
// //       case Routes.storeDetailsRoute:
// //         return MaterialPageRoute(builder: (_) => const StoreDetailsView());
// //       default:
// //         return noRoute();
// //     }
// //   }

// //   static Route<dynamic> noRoute() {
// //     return MaterialPageRoute(
// //       builder: (_) => const NoRouteView(),
// //     );
// //   }
// // }
