import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmacy/app.dart';

extension WidgetTesterX on WidgetTester {
  ProviderContainer get container {
    final element = this.element(find.byType(MyApp));
    return ProviderScope.containerOf(element);
  }
}
