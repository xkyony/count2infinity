import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/services/auth/repo.dart';
import 'package:pharmacy/services/user/route.dart';

import 'features/counter/route.dart';
import 'services/routing/go_router_refresh_stream.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return GoRouter(
    initialLocation: '/counters',
    refreshListenable: GoRouterRefreshStream(authRepo.userStream),
    redirect: (context, state) {
      final isLoggedIn = authRepo.isLoggedIn;
      final path = state.uri.path;
      final isSigningIn = path == '/users/sign_in';
      final isSigningUp = path == '/users/sign_up';

      // NOTE: /counters is not guarded
      if (path == '/counters') {
        return null;
      }

      // Redirect to login page and save the intended location in query parameter
      if (!isLoggedIn && !isSigningIn && !isSigningUp) {
        print('Here in !isLoggedIn');
        return '/users/sign_in?redirect=$path';
      }

      // Redirect to the intended destination if logged in and on the login or sign-up page
      if (isLoggedIn && (isSigningIn || isSigningUp)) {
        final redirectLocation =
            state.uri.queryParameters['redirect'] ?? '/counters';
        return redirectLocation;
      }

      return null;
    },
    routes: [
      counterRoute,
      ...userRoutes,
    ],
  );
});
