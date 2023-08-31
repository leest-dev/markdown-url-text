<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A lightweight widget that parses a text with markdown-style formatted links, and makes makes them tappable.
It uses RichText and TextSpan (no html).

## Example

'Click \[here](https://leest.dev) to visit. \[Learn more](https://leest.dev).' =>
<Widget>Click [here](https://leest.dev) to visit. [Learn more](https://leest.dev).

## Usage

```dart
UrlText('Click [here](https://leest.dev) to visit. [Learn more](https://leest.dev).', 
    style: TextStyle(color: Colors.black), linkStyle: LinkStyle(color: Colors.blue));
```