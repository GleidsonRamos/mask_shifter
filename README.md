# mask_shifter

This package provides a way to switch between two masks in a TextField

## Getting Started

Import the packages:

```dart
import 'package:mask_shifter/mask_shifter.dart';
```

## Its very simple to use:

Just pass the class as an input formatter.
Example:

```dart
return TextField(
          inputFormatters: [
            MaskedTextInputFormatterShifter(
                maskONE:"XXX.XXX.XXX-XX",
                maskTWO:"XX.XXX.XXX/XXXX-XX"
             ),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.label,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
```

There are two parameters, maskONE and maskTWO.
maskONE must be the shorter mask, and maskTWO the longest.

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
