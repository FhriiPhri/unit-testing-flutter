class Validator {
  static bool isValidEmail(String email) {
    // Regex simpel buat validasi email
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
}