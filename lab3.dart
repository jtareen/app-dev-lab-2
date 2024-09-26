import 'dart:io';

void main() {
  print("Please enter your age:");

  try {
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      throw FormatException("No input provided.");
    }

    int age = int.parse(input);

    if (age < 0 || age > 120) {
      throw RangeError("Please enter a valid age between 0 and 120.");
    }

    int yearsLeft = 100 - age;
    if (yearsLeft > 0) {
      print("You have $yearsLeft years left until you turn 100.");
    } else {
      print("You are already 100 years old or older!");
    }
  } on FormatException catch (e) {
    print("Error: ${e.message}");
  } on RangeError catch (e) {
    print("Error: ${e.message}");
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
