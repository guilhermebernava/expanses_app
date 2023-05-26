import 'package:common/presenters/widgets/common_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('It should create the widget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 200,
            child: CommonInput(
              label: 'test',
            ),
          ),
        ),
      ),
    );
    expect(find.byType(CommonInput), findsOneWidget);
  });

  testWidgets('It should have an label', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 200,
            child: CommonInput(
              label: 'test',
            ),
          ),
        ),
      ),
    );
    expect(find.text("test"), findsOneWidget);
  });

  testWidgets('It should write in input', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 200,
            child: CommonInput(
              label: 'test',
            ),
          ),
        ),
      ),
    );

    final input = find.byType(CommonInput);

    await tester.enterText(input, "teste");
    await tester.pump();

    expect(find.text("teste"), findsOneWidget);
  });

  testWidgets('It should have an ICON when isPassword is true', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 200,
            child: CommonInput(
              isPassword: true,
              label: 'test',
            ),
          ),
        ),
      ),
    );

    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('It should click on counter', (tester) async {
    bool isClicked = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 200,
            child: CommonInput(
              isPassword: true,
              counterLabel: "counter",
              onCounterTap: () {
                isClicked = true;
              },
              label: 'test',
            ),
          ),
        ),
      ),
    );

    final counter = find.text("counter");
    await tester.tap(counter);
    await tester.pump();
    expect(isClicked, true);
  });

  testWidgets('It should onChanged works', (tester) async {
    String? text;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 200,
            child: CommonInput(
              onChanged: (val) {
                text = val;
              },
              label: 'test',
            ),
          ),
        ),
      ),
    );
    final input = find.byType(CommonInput);
    await tester.enterText(input, "teste");
    await tester.pump();

    expect(text, "teste");
  });
}
