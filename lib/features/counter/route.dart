import 'package:go_router/go_router.dart';
import 'index_page.dart';
import 'new_page.dart';
import 'edit_page.dart';
import 'show_page.dart';

final counterRoute = GoRoute(
  path: '/counters',
  builder: (context, state) => const CounterIndexPage(),
  routes: [
    GoRoute(
      path: 'new',
      builder: (context, state) => const CounterNewPage(),
    ),
    GoRoute(
      path: ':id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CounterShowPage(id: id);
      },
      routes: [
        GoRoute(
          path: 'edit',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return CounterEditPage(id: id);
          },
        ),
      ],
    ),
  ],
);
