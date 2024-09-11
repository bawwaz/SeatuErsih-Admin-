import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RupiahFormatter extends TextInputFormatter {
  final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Prevents the input if the user deletes everything
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove any non-digit characters from the input
    String cleanText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Convert the string into a number
    int value = int.tryParse(cleanText) ?? 0;

    // Format the value as Rupiah currency
    String formattedText = _currencyFormatter.format(value);

    // Maintain the cursor position
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
