import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_dice_app';  // Update the import path if necessary

void main() {
  testWidgets('Dice roll functionality test', (WidgetTester tester) async {
    // Build the app widget.
    await tester.pumpWidget(const MyApp());

    // Verify that the initial dice image is shown (assumes it's the first image)
    expect(find.byType(Image), findsOneWidget);  // Check that the dice image is displayed
    expect(find.byType(ElevatedButton), findsOneWidget);  // Check for the Roll button

    // Verify that the initial image is the first dice image
    expect(find.image(AssetImage('assets/images/dice-1.png')), findsOneWidget);

    // Tap the "Roll" button to trigger the dice roll.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();  // Rebuild the widget tree to reflect the state change

    // After rolling, check that the dice image has changed.
    // You can adjust the expected dice images based on the random number.
    expect(find.byType(Image), findsOneWidget);  // Verify that an image is still displayed
    expect(
      find.image(AssetImage('assets/images/dice-1.png')),
      findsNothing,
    );  // It should not be the same as the initial dice image

    // Optionally, verify that the dice number was updated by checking if a different image is shown.
    // This is a basic test to see if the dice image changes after tapping the button.
  });
}
