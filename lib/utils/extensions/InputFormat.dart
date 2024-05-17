import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InputFormat {
  static List<TextInputFormatter> price() {
    return [
      TextInputFormatter.withFunction(
        (oldValue, newValue) => newValue.copyWith(
          text: newValue.text.replaceAll(',', '.'),
        ),
      ),
      FilteringTextInputFormatter.allow(
        RegExp(r'^\d+\.?\d{0,2}'),
      ),
      _CustomInputPrice(),
    ];
  }

  static TextInputFormatter limitRange(int maxLength) {
    return LengthLimitingTextInputFormatter(maxLength);
  }

  static TextInputFormatter ditgit() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  static TextInputFormatter qty() {
    return FilteringTextInputFormatter.deny(
      RegExp(r'^0+'), //users can't type 0 at 1st position
    );
  }

  static TextInputFormatter lowerCase() {
    return _LowerCaseTextFormatter();
  }

  static TextInputFormatter currency() {
    return _NumericTextFormatter();
  }

  static TextInputFormatter text() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z0-9\s]'),
    );
  }

  static TextInputFormatter denyEmoji() {
    return FilteringTextInputFormatter.deny(RegExp(
        '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'));
  }
}

class _LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(), // Convert to lowercase
      selection: newValue.selection,
    );
  }
}

class _NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = NumberFormat("#,###");
      final number =
          int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(number);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}

class _CustomInputPrice extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    final oldText = oldValue.text;
    if (newText.isNotEmpty) {
      if (oldText.startsWith('0') &&
          newText.length == 2 &&
          newText.endsWith('0')) {
        if (oldText.length > 1 && RegExp('^0+\$').hasMatch(newText)) {
          return newValue;
        }
        return oldValue;
      } else if (oldText.startsWith('0') &&
          newText.length == 2 &&
          oldText.length == 1 &&
          !newText.endsWith('.')) {
        var text = newText.substring(newText.length - 1);
        final int selectionIndexFromTheRight =
            newValue.text.length - newValue.selection.end;
        return newValue.copyWith(
          text: text,
          selection: TextSelection.collapsed(
            offset: text.length - selectionIndexFromTheRight,
          ),
        );
      }
    }
    return newValue;
  }
}
