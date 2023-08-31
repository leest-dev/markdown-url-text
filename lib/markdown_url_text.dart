library url_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownUrlText extends StatelessWidget {
  const MarkdownUrlText(this.text, {this.textStyle, this.linkStyle, Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(text: parse(text));
  }

  TextSpan parse(String text) {
    final linkRegExp = RegExp(r'\[(.*?)\]\((.*?)\)');
    final match = linkRegExp.firstMatch(text);
    if (match == null) {
      return TextSpan(text: text, style: textStyle);
    } else {
      final before = text.substring(0, match.start);
      final after = text.substring(match.end);
      final linkText = match.group(1);
      final link = match.group(2);
      return TextSpan(
        style: textStyle,
        children: [
          TextSpan(text: before),
          TextSpan(
            text: linkText,
            style: textStyle?.merge(linkStyle),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final uri = Uri.parse(link!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  throw 'Could not launch $link';
                }
              },
          ),
          parse(after),
        ],
      );
    }
  }
}
