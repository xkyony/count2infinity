// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './../step/the_app_is_running.dart';
import './../step/the_app_has2_counters.dart';
import './../step/i_visit.dart';
import './../step/clean_up.dart';
import './../step/i_see_the_counter_value_is.dart';
import './../step/i_tap_the_increment_button.dart';
import './../step/i_tap_the_decrement_button.dart';
import './../step/i_tap_the_reset_button.dart';
import './../step/i_increment_the_counter_times.dart';
import './../step/i_save_the_counter.dart';
import './../step/i_retrieve_the_saved_counter_value.dart';
import './../step/i_save_the_current_counter_value_at.dart';
import './../step/i_decrement_the_counter_times.dart';
import './../step/the_counter_time_contains.dart';
import './../step/the_database_has_counter_value.dart';
import './../step/i_save_the_current_counter_value.dart';
import './../step/i_see_the_counter_max_value.dart';
import './../step/i_reset_the_counter.dart';
import './../step/i_see_the_counter_min_value.dart';

void main() {
  group('''The user can''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await theAppHas2Counters(tester);
      await iVisit(tester, '/counters/current');
    }

    Future<void> bddTearDown(WidgetTester tester) async {
      await cleanUp(tester);
    }

    testWidgets('''see the initial value''', (tester) async {
      try {
        await bddSetUp(tester);
        await iSeeTheCounterValueIs(tester, '0');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''increment the counter''', (tester) async {
      try {
        await bddSetUp(tester);
        await iTapTheIncrementButton(tester);
        await iSeeTheCounterValueIs(tester, '1');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''decrement the counter''', (tester) async {
      try {
        await bddSetUp(tester);
        await iTapTheDecrementButton(tester);
        await iSeeTheCounterValueIs(tester, '-1');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''reset the counter''', (tester) async {
      try {
        await bddSetUp(tester);
        await iTapTheResetButton(tester);
        await iSeeTheCounterValueIs(tester, '0');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''save to and retrieve from local storage''', (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSeeTheCounterValueIs(tester, '5');
        await iSaveTheCounter(tester);
        await iIncrementTheCounterTimes(tester, 2);
        await iSeeTheCounterValueIs(tester, '7');
        await iRetrieveTheSavedCounterValue(tester);
        await iSeeTheCounterValueIs(tester, '5');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''display the timestamp of when the counter value was saved''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSaveTheCurrentCounterValueAt(tester, '2024-03-05 13:30');
        await iDecrementTheCounterTimes(tester, 2);
        await iRetrieveTheSavedCounterValue(tester);
        await iSeeTheCounterValueIs(tester, '5');
        await theCounterTimeContains(tester, '13:30');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''sync the counter in realtime with external database''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSeeTheCounterValueIs(tester, '5');
        await theDatabaseHasCounterValue(tester, 5);
        await iDecrementTheCounterTimes(tester, 2);
        await iSeeTheCounterValueIs(tester, '3');
        await theDatabaseHasCounterValue(tester, 3);
        await iTapTheResetButton(tester);
        await iSeeTheCounterValueIs(tester, '0');
        await theDatabaseHasCounterValue(tester, 0);
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''sync in realtime after saving to local storage''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSaveTheCurrentCounterValue(tester);
        await iDecrementTheCounterTimes(tester, 2);
        await iRetrieveTheSavedCounterValue(tester);
        await theDatabaseHasCounterValue(tester, 5);
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''track the max value''', (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSeeTheCounterValueIs(tester, '5');
        await iSeeTheCounterMaxValue(tester, '5');
        await iDecrementTheCounterTimes(tester, 2);
        await iSeeTheCounterValueIs(tester, '3');
        await iSeeTheCounterMaxValue(tester, '5');
        await iResetTheCounter(tester);
        await iSeeTheCounterValueIs(tester, '0');
        await iSeeTheCounterMaxValue(tester, '5');
        await iDecrementTheCounterTimes(tester, 7);
        await iSeeTheCounterValueIs(tester, '-7');
        await iSeeTheCounterMaxValue(tester, '5');
        await iIncrementTheCounterTimes(tester, 17);
        await iSeeTheCounterValueIs(tester, '10');
        await iSeeTheCounterMaxValue(tester, '10');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''track the min value''', (tester) async {
      try {
        await bddSetUp(tester);
        await iIncrementTheCounterTimes(tester, 5);
        await iSeeTheCounterValueIs(tester, '5');
        await iSeeTheCounterMinValue(tester, '0');
        await iDecrementTheCounterTimes(tester, 7);
        await iSeeTheCounterValueIs(tester, '-2');
        await iSeeTheCounterMinValue(tester, '-2');
        await iResetTheCounter(tester);
        await iSeeTheCounterValueIs(tester, '0');
        await iSeeTheCounterMinValue(tester, '-2');
        await iDecrementTheCounterTimes(tester, 5);
        await iSeeTheCounterValueIs(tester, '-5');
        await iSeeTheCounterMinValue(tester, '-5');
        await iIncrementTheCounterTimes(tester, 17);
        await iSeeTheCounterValueIs(tester, '12');
        await iSeeTheCounterMinValue(tester, '-5');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
