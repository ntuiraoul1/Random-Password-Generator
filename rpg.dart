import 'dart:math';

String generatePassword(
                        int length, 
                        bool includeUppercase, 
                        bool includeLowercase, 
                        bool includeNumbers, 
                        bool includeSpecial) 
{
  String password = "";
  final random = Random();

  // Define character sets based on inclusion flags
  final String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String lowercase = 'abcdefghijklmnopqrstuvwxyz';
  final String numbers = '0123456789';
  final String special = '!@#%^&*()_+-=[]{};:\'\"\|,.<>/?';

  // Combine character sets based on user selection
  String charPool = "";

  if (includeUppercase) charPool += uppercase;
  if (includeLowercase) charPool += lowercase;
  if (includeNumbers) charPool += numbers;
  if (includeSpecial) charPool += special;

  // Ensure at least one character type is included
  if (charPool.isEmpty) {
    throw ArgumentError("At least one character type (uppercase, lowercase, numbers, or special) must be included");
  }

  // Generate random password characters
  for (int i = 0; i < length; i++) {
    final charIndex = random.nextInt(charPool.length);
    password += charPool[charIndex];
  }

  return password;
}

void main() {
  // Example usage with customization (adjust as needed)
  int passwordLength = 16;
  bool includeUppercase = true;
  bool includeLowercase = true;
  bool includeNumbers = true;
  bool includeSpecial = true;

  String generatedPassword = generatePassword(
   passwordLength, 
   includeUppercase, 
   includeLowercase, 
   includeNumbers, 
   includeSpecial);
  print("Generated Password: $generatedPassword");
}
// generatePassword function:

// Takes arguments for password length and inclusion flags for uppercase, lowercase, numbers, and special characters.
// Initializes an empty string for the password and a Random object.
// Defines character sets for each type based on flags.
// Builds a combined character pool based on user selection.
// Throws an error if no character type is included.
// Loops for the desired length, randomly selects characters from the pool, and adds them to the password string.
// Returns the generated password.
// main function:

// Sets example values for password length and inclusion flags (modify as needed).
// Calls the generatePassword function with the defined parameters.
// Prints the generated password to the console.
// Customization:

// Modify the example values in main to control password length and character inclusion.
// You can further enhance the program by adding options for minimum occurrences of each character type within the password.