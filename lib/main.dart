import 'package:flutter/material.dart';

import 'app.dart';
import 'providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final scope = await initializeScope(const MyApp());
  runApp(scope);
}
