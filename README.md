A lightweight widget that parses a text with markdown-style formatted links, and makes makes them tappable. 

Based on Flutter's built-in RichText rather than html.

## Example

#### Before
```dart
'Click [here](https://leest.app) to visit. [Learn more](https://leest.dev).'
```

#### After
Click [here](https://leest.app) to visit. [Learn more](https://leest.dev).

## Usage

```dart
UrlText('Click [here](https://leest.app) to visit. [Learn more](https://leest.dev).', 
    style: TextStyle(color: Colors.black), linkStyle: TextStyle(color: Colors.blue));
```