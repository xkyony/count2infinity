import 'package:go_router/go_router.dart';
import 'new_screen.dart';
import 'show_screen.dart';
import 'signin_screen.dart';

final userRoutes = <RouteBase>[
  GoRoute(
    path: 'users/register',
    builder: (context, state) => const UserNewScreen(),
  ),
  GoRoute(
    path: 'users/sign_in',
    builder: (context, state) {
      final redirect = state.uri.queryParameters['redirect'] ?? '/counters';
      return UserSignInScreen(redirect: redirect);
    },
  ),
  // GoRoute(
  //   path: '/sign_out',
  //   builder: (context, state) => const UserShowScreen(),
  // ),
  GoRoute(
    path: 'users/profile',
    builder: (context, state) => const UserShowScreen(),
  ),
];
