// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './../step/the_app_is_running.dart';
import './../step/the_app_has2_counters.dart';
import './../step/i_visit.dart';
import './../step/clean_up.dart';
import './../step/i_am_logged_in_as.dart';
import './../step/i_see.dart';
import './../step/i_tap_icon.dart';
import './../step/i_fill_in_with.dart';
import './../step/i_tap_the_button.dart';
import './../step/i_double_tap.dart';
import './../step/i_am_not_logged_in.dart';
import './../step/i_am_redirected_to_the_page.dart';
import './../step/i_succeed_to_login_with_email_and_password.dart';
import './../step/i_fail_to_login_with_email_and_password.dart';
import '../step/i_go_back.dart';

void main() {
  group('''Counter creation''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await theAppHas2Counters(tester);
      await iVisit(tester, '/counters');
    }

    Future<void> bddTearDown(WidgetTester tester) async {
      await cleanUp(tester);
    }

    testWidgets('''succeeds for authenticated users''', (tester) async {
      try {
        await bddSetUp(tester);
        await iAmLoggedInAs(tester, 'Mr.Bean');
        await iSee(tester, '2 Counters');
        await iTapIcon(tester, Icons.add);
        await iSee(tester, 'Add Counter');
        await iFillInWith(tester, 'counter name', 'New Counter');
        await iFillInWith(tester, 'counter value', '100');
        await iTapTheButton(tester, 'Add Counter');
        await iSee(tester, '3 Counters');
        await iSee(tester, '100');
        await iDoubleTap(tester, 'New Counter');
        await iSee(tester, 'New Counter');
        await iSee(tester, 'Created by');
        await iSee(tester, 'Mr.Bean');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''redirects unauthenticated users to login''', (tester) async {
      try {
        await bddSetUp(tester);
        await iAmNotLoggedIn(tester);
        await iTapIcon(tester, Icons.add);
        await iAmRedirectedToThePage(tester, '/users/sign_in');
        await iSucceedToLoginWithEmailAndPassword(
            tester, 'mrbean@hari.co', 'Qu1rkY');
        await iAmLoggedInAs(tester, 'Mr.Bean');
        await iAmRedirectedToThePage(tester, '/counters/new');
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''allows guests to return home after failed login''',
        (tester) async {
      try {
        await bddSetUp(tester);
        await iAmNotLoggedIn(tester);
        await iTapIcon(tester, Icons.add);
        await iAmRedirectedToThePage(tester, '/users/sign_in');
        await iFailToLoginWithEmailAndPassword(tester, 'wrong@user.co', 'bad');
        await iGoBack(tester);
        await iAmRedirectedToThePage(tester, '/counters');
        await iSee(tester, '2 Counters');
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
