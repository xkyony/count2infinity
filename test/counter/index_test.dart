// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './../step/the_app_is_running.dart';
import './../step/the_app_has2_counters.dart';
import './../step/i_visit.dart';
import './../step/clean_up.dart';
import './../step/i_see.dart';
import 'package:bdd_widget_test/step/i_see_multiple_widgets.dart';
import './../step/i_double_tap.dart';
import './../step/i_tap_icon.dart';
import './../step/i_fill_in_with.dart';
import './../step/i_tap_the_button.dart';
import './../step/i_tap_the_deleted_button_for.dart';
import './../step/i_dont_see.dart';
import './../step/i_tap_the_edit_button_for.dart';

void main() {
  group('''The user can''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await theAppHas2Counters(tester);
      await iVisit(tester, '/counters');
    }

    Future<void> bddTearDown(WidgetTester tester) async {
      await cleanUp(tester);
    }

    testWidgets('''display the counters in a table''', (tester) async {
      try {
        await bddSetUp(tester);
        await iSee(tester, 'Name');
        await iSee(tester, 'Value');
        await iSeeMultipleWidgets(tester, DataTable);
        await iSee(tester, '2 Counters');
        await iSee(tester, 'Current Counter');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''go to see the counter details''', (tester) async {
      try {
        await bddSetUp(tester);
        await iDoubleTap(tester, 'Current Counter');
        await iSee(tester, 'Minimum');
        await iSee(tester, 'Maximum');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''add a new counter''', (tester) async {
      try {
        await bddSetUp(tester);
        await iSee(tester, '2 Counters');
        await iTapIcon(tester, Icons.add);
        await iSee(tester, 'Add New Counter');
        await iFillInWith(tester, 'counter name', 'New Counter');
        await iFillInWith(tester, 'counter value', '100');
        await iTapTheButton(tester, 'Add Counter');
        await iSee(tester, '3 Counters');
        await iSee(tester, 'New Counter');
        await iSee(tester, '100');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''delete a counter''', (tester) async {
      try {
        await bddSetUp(tester);
        await iSee(tester, '2 Counters');
        await iSee(tester, 'To be deleted counter');
        await iTapTheDeletedButtonFor(tester, 'To be deleted counter');
        await iDontSee(tester, 'To be deleted counter');
        await iSee(tester, '1 Counters');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''edit a counter''', (tester) async {
      try {
        await bddSetUp(tester);
        await iSee(tester, 'Current Counter');
        await iTapTheEditButtonFor(tester, 'Current Counter');
        await iSee(tester, 'Edit Counter');
        await iFillInWith(tester, 'counter name', 'Edited Counter');
        await iFillInWith(tester, 'counter value', '200');
        await iTapTheButton(tester, 'Edit Counter');
        await iDontSee(tester, 'Current Counter');
        await iSee(tester, 'Edited Counter');
        await iSee(tester, '200');
        await iSee(tester, '2 Counters');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
