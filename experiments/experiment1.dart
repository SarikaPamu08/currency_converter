void main() {
  String studentName = "Sarika";
  int amount = 100;
  double exchangeRate = 83.50;
  bool isConversionSuccessful = true;

  double convertedAmount = amount * exchangeRate;

  print("Currency Converter - Dart Basics");
  print("Student: $studentName");
  print("Amount in USD: $amount");
  print("Exchange rate: $exchangeRate");
  print("Amount in INR: ₹$convertedAmount");
  print("Conversion successful: $isConversionSuccessful");
}