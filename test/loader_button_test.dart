import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_button/loader_button.dart';

void main() {
  testWidgets('LoaderButton shows loadingWidget when isLoading is true', (
    WidgetTester tester,
  ) async {
    const loadingKey = Key('loading-widget');
    const normalKey = Key('normal-child');

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: LoaderButton(
            isLoading: true,
            loadingWidget: const SizedBox(key: loadingKey),
            child: const SizedBox(key: normalKey),
          ),
        ),
      ),
    );

    expect(find.byKey(loadingKey), findsOneWidget);
    expect(find.byKey(normalKey), findsNothing);
  });

  testWidgets('LoaderButton shows child when isLoading is false', (
    WidgetTester tester,
  ) async {
    const loadingKey = Key('loading-widget');
    const normalKey = Key('normal-child');

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: LoaderButton(
            isLoading: false,
            loadingWidget: const SizedBox(key: loadingKey),
            child: const SizedBox(key: normalKey),
          ),
        ),
      ),
    );

    expect(find.byKey(loadingKey), findsNothing);
    expect(find.byKey(normalKey), findsOneWidget);
  });
}
