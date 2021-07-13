// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:refresh_example/main.dart';
import 'package:refresh_example/my_refresh.dart';
import 'package:refresh_example/my_refresh_service.dart';

class MockMyRefreshService extends Mock implements MyRefreshService {}

void main() {
  group('Refresh Test', () {
    testWidgets('Pull down triggers refresh', (tester) async {
      var service = MockMyRefreshService();
      when(() => service.refresh()).thenReturn(() {});

      await tester.pumpWidget(MaterialApp(home: MyRefresh(service)));

      await tester.drag(find.byKey(Key('my_text')), Offset(0, 500));

      verify(() => service.refresh());
    });
  });
}
