import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/counter/index_page.dart';
import 'features/counter/route.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/counters',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CounterIndexPage(),
        routes: [
          counterRoute,
        ],
      ),
    ],
  );
});
