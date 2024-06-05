// ignore: file_names
bool isValidDateFormat(String date) {
  // Expresión regular para validar el formato de fecha dd/mm/yyyy
  final dateRegExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  if (!dateRegExp.hasMatch(date)) {
    return false;
  }

  // Verificación adicional para validar día, mes y año
  try {
    final parts = date.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    if (day < 1 || day > 31 || month < 1 || month > 12) {
      return false;
    }

    // Validación de días específicos en función del mes y si es año bisiesto
    final isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    final daysInMonth = [
      31,
      isLeapYear ? 29 : 28,
      31,30,31,30,31,31,30,31,30,31
    ];

    if (day > daysInMonth[month - 1]) {
      return false;
    }

    return true;
  } catch (e) {
    return false;
  }
}
