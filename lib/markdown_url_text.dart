library url_text;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownUrlText extends StatelessWidget {
  const MarkdownUrlText(this.text,
      {this.style,
      this.linkStyle,
      this.textAlign,
      this.softWrap,
      this.overflow,
      this.maxLines,
      this.locale,
      this.strutStyle,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.selectionColor,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? style;
  final TextStyle? linkStyle;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: parse(text),
      textAlign: textAlign ?? TextAlign.start,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor ?? 1.0,
      selectionColor: selectionColor,
    );
  }

  TextSpan parse(String text) {
    final linkRegExp = RegExp(r'\[(.*?)\]\((.*?)\)');
    final match = linkRegExp.firstMatch(text);
    if (match == null) {
      return TextSpan(text: text, style: style);
    } else {
      final before = text.substring(0, match.start);
      final after = text.substring(match.end);
      final linkText = match.group(1);
      final link = match.group(2);
      return TextSpan(
        style: style,
        children: [
          TextSpan(text: before),
          TextSpan(
            text: linkText,
            style: style?.merge(linkStyle),
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
