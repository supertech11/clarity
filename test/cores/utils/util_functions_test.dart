// import 'package:flutter_test/flutter_test.dart';
// import 'package:test/test.dart' as Test;
import 'package:flutter_test/flutter_test.dart';
import 'package:saffron_clarity/src/core/utils/util_functions.dart';

void main() {
  setUp(() {});

  group('Util Functions Tests', () {
    test(
        'Capitalize First Alphabet and return the rest as lower case character',
        () {
      expect(UtilFunctions.capitalizeFirst("olUWAtosin"), "Oluwatosin");
      expect(UtilFunctions.capitalizeFirst("oluwatosin"), "Oluwatosin");
      expect(UtilFunctions.capitalizeFirst("Oluwatosin"), "Oluwatosin");
      expect(UtilFunctions.capitalizeFirst(""), "");
      expect(UtilFunctions.capitalizeFirst(null), "");
    });

    test('Pluralize  based on count and return updated Message', () {
      expect(UtilFunctions.pluralizeMessage(3, "Orange"), "Oranges");
      expect(UtilFunctions.pluralizeMessage(1, "Orange"), "Orange");
      expect(UtilFunctions.pluralizeMessage(0, "Orange"), "Orange");
    });

    test('Format date', () {
      expect(
          UtilFunctions.parseDate("2022-05-10T14:18:55.325Z"), "10 May 2022");
      expect(
          UtilFunctions.parseDate("2022-06-16T16:52:42.000Z"), "16 Jun 2022");
      expect(UtilFunctions.parseDate(null), "");
      expect(
          UtilFunctions.parseDate("2022-06-:42.000Z"), "Invalid date format");
    });
  });

  test('Get name from index', () {
    expect(UtilFunctions.getNameInitials("Oluwatosin", 0), "Oluwatosin");
    expect(UtilFunctions.getNameInitials("Oluwatosin Idowu", 1), "Idowu");
    expect(UtilFunctions.getNameInitials("", 1), "");
  });

  test('Get first character of a string', () {
    expect(UtilFunctions.getFirstCharacter("Oluwatosin"), "O");
    expect(UtilFunctions.getFirstCharacter("Idowu"), "I");
    expect(UtilFunctions.getFirstCharacter(""), "");
    expect(UtilFunctions.getFirstCharacter(null), "");
  });
}
