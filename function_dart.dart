void main() {
  // Sample item prices
  List<double> itemPrices = [5.99, 15.49, 20.0, 8.0, 30.0, 12.5];

  // Filter out items under $10 using an anonymous function
  var filteredPrices = itemPrices.where((price) => price >= 10).toList();

  // Calculate total price with optional tax parameter
  double total = calculateTotal(filteredPrices, tax: 0.07);
  print('Total after tax: \frw${total.toStringAsFixed(2)}');

  // Apply discount
  double discountPercentage = 10; // 10% discount
  List<double> discountedPrices = applyDiscount(filteredPrices, (price) {
    return price * (1 - discountPercentage / 100);
  });

  // Calculate the final price after discount
  double finalPrice = calculateTotal(discountedPrices);
  print('Final price after discount: \frw${finalPrice.toStringAsFixed(2)}');

  // Calculate special discount using recursive function
  double specialDiscount = calculateFactorialDiscount(filteredPrices.length);
  finalPrice *= (1 - specialDiscount / 100);

  print('Final price after special discount: \frw${finalPrice.toStringAsFixed(2)}');
}

// Standard function to calculate total with optional tax
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total = prices.reduce((a, b) => a + b);
  return total * (1 + tax);
}

// Higher-order function to apply discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1; // Factorial of 0 or 1 is 1
  return n * calculateFactorialDiscount(n - 1);
}
