// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/clean_up.dart';
import './step/i_see.dart';
import './step/i_tap_the_increment_button.dart';
import './step/i_tap_the_decrement_button.dart';
import './step/i_tap_the_reset_button.dart';
import './step/i_increment_the_counter_times.dart';
import './step/i_save_the_current_counter_value.dart';
import './step/i_retrieve_the_saved_counter_value.dart';
import './step/i_save_the_current_counter_value_at.dart';
import './step/i_decrement_the_counter_times.dart';
import './step/i_spot.dart';
import './step/the_database_has_counter_value.dart';

void main() {
  group('''Counter::''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
    }

    Future<void> bddTearDown(WidgetTester tester) async {
      await cleanUp(tester);
    }

    testWidgets('''Initial value is 0''', (tester) async {
      try {
        await bddSetUp(tester);
        await iSee(tester, '0');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Increment''', (tester) async {
      try {
        await bddSetUp(tester);
        await iTapTheIncrementButton(tester);
        await iSee(tester, '1');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Decrement''', (tester) async {
      try {
        await bddSetUp(tester);
        await iTapTheDecrementButton(tester);
        await iSee(tester, '-1');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Reset''', (tester) async {
      try {
        await bddSetUp(tester);
        await iTapTheResetButton(tester);
        await iSee(tester, '0');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Local Storage Save and retrieve''', (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSee(tester, '5');
        await iSaveTheCurrentCounterValue(tester);
        await iIncrementTheCounterTimes(tester, 2);
        await iSee(tester, '7');
        await iRetrieveTheSavedCounterValue(tester);
        await iSee(tester, '5');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets(
        '''Save and display the timestamp of when the counter value was saved''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSaveTheCurrentCounterValueAt(tester, '2024-03-05 13:30');
        await iDecrementTheCounterTimes(tester, 2);
        await iRetrieveTheSavedCounterValue(tester);
        await iSee(tester, '5');
        await iSpot(tester, '2024-03-05 13:30');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Save and sync in realtime with external database''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSee(tester, '5');
        await theDatabaseHasCounterValue(tester, 5);
        await iDecrementTheCounterTimes(tester, 2);
        await iSee(tester, '3');
        await theDatabaseHasCounterValue(tester, 3);
        await iTapTheResetButton(tester);
        await iSee(tester, '0');
        await theDatabaseHasCounterValue(tester, 0);
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
