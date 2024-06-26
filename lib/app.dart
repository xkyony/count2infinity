import 'package:flutter/material.dart';
import 'package:pharmacy/initialization.dart';

import 'features/counter/show_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppInitialization(
      child: MaterialApp(
        title: 'Counter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const CounterShowPage(
          title: 'Counter Demo Page',
        ),
      ),
    );
  }
}
