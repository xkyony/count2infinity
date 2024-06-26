import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/firebase_options.dart';
import 'package:pharmacy/services/database/cloud_firestore/instance.dart';
import 'package:pharmacy/services/local_storage/shared_preferences/repository.dart';

import 'services/local_storage/repository.dart';

// Initialize top level providers/repositories
Future<ProviderContainer> initializeProviders() async {
  final container = ProviderContainer();

  // local storage: shared preferences
  final sharedPreferencesRepository =
      await container.read(sharedPreferencesRepositoryProvider.future);
  return ProviderContainer(overrides: [
    localStorageRepositoryProvider
        .overrideWithValue(sharedPreferencesRepository),
  ]);
}

Future<ProviderScope> initializeScope(Widget child) async {
  final container = ProviderContainer();
  final sharedPreferencesRepository =
      await container.read(sharedPreferencesRepositoryProvider.future);
  await container.read(firebaseAppProvider.future);

  return ProviderScope(
    overrides: [
      localStorageRepositoryProvider
          .overrideWithValue(sharedPreferencesRepository),
      firebaseAppProvider.overrideWith(
        (ref) => Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
      ),
    ],
    child: child,
  );
}
