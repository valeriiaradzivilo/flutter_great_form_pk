import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_form/additional_forms/scrollable_form.dart';
import 'package:great_form/helpers/great_form_field.dart';
import 'package:great_form/helpers/validator.dart';

void main() {
  testWidgets('GreatFormField renders correctly', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GreatFormField(
            key: const Key('greatFormField'), // Provide a key for testing
            controller: TextEditingController(),
            hintText: 'Enter text',
            validateOnInput: true,
            validator: Validator.none,
            expand: false,
          ),
        ),
      ),
    );

    // Verify that the widget has the correct label (hintText).
    expect(find.text('Enter text'), findsOneWidget);

    // Verify that the widget has the correct number of lines.
    expect(find.byType(TextFormField), findsOneWidget);

    // Type the text
    await tester.enterText(find.byType(GreatFormField), "This is the text");

    // Verify that the text is visible
    expect(find.text('This is the text'), findsOneWidget);
  });

  testWidgets('ScrollableForm renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScrollableForm(
            builder: (context, index) =>
                GreatFormField(hintText: 'Item $index'),
            gap: 10,
            childCount: 5,
            isVertical: true,
          ),
        ),
      ),
    );

    // Verify if the widgets are rendered correctly
    expect(find.text('Item 0'), findsOneWidget);
    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Item 2'), findsOneWidget);
    expect(find.text('Item 3'), findsOneWidget);
    expect(find.text('Item 4'), findsOneWidget);
  });
}
