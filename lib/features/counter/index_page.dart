import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy/services/auth/controller.dart';
import 'package:pharmacy/widgets/async_value_widget.dart';
import 'package:pharmacy/services/auth/repo.dart';

import 'controller.dart';

class CounterIndexPage extends ConsumerWidget {
  const CounterIndexPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(counterListProvider),
      data: (counters) => Scaffold(
        appBar: AppBar(
          title: Text('${counters.length} Counters'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              AsyncValueWidget(
                value: ref.watch(userStreamProvider),
                data: (user) => UserAccountsDrawerHeader(
                  accountName: Text(user?.displayName ?? 'User'),
                  accountEmail: Text(user?.email ?? 'No email'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL)
                        : null,
                    child: user?.photoURL == null
                        ? Text(
                            user?.displayName.substring(0, 1).toUpperCase() ??
                                'U',
                            style: const TextStyle(fontSize: 40),
                          )
                        : null,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  GoRouter.of(context).go('/users/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  await ref.read(authRepoProvider).signOut();
                  // how to close the drawer
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Value')),
              DataColumn(label: Text('')),
            ],
            rows: counters.map((counter) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(
                      key: Key('counter_name_${counter.id}'),
                      counter.name,
                    ),
                    onDoubleTap: () {
                      context.go('/counters/${counter.id}');
                    },
                  ),
                  DataCell(
                    Text(
                      key: Key('counter_value_${counter.id}'),
                      '${counter.value}',
                    ),
                    onDoubleTap: () => context.go('/counters/${counter.id}'),
                  ),
                  DataCell(
                    Wrap(
                      children: [
                        IconButton(
                          key: Key('edit_button_${counter.id}'),
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            context.go('/counters/${counter.id}/edit');
                          },
                        ),
                        IconButton(
                          key: Key('delete_button_${counter.id}'),
                          color: Colors.red,
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            ref
                                .read(counterControllerProvider.notifier)
                                .delete(counter);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/counters/new'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

