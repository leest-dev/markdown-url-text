import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:markdown_url_text/markdown_url_text.dart';

void main() {
  testWidgets('UrlText renders plain text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MarkdownUrlText('Hello, world!'),
      ),
    );

    expect(find.textContaining('Hello, world!', findRichText: true),
        findsOneWidget);
    expect(find.byType(RichText), findsOneWidget);
  });

  testWidgets('UrlText parses and renders links', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MarkdownUrlText('Click [here](https://example.com) to visit.'),
      ),
    );

    expect(find.textContaining('Click ', findRichText: true), findsOneWidget);
    expect(find.textContaining('here', findRichText: true), findsOneWidget);
    expect(
        find.textContaining(' to visit.', findRichText: true), findsOneWidget);
  });
}
