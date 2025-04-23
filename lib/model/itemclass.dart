
// ignore: camel_case_types
class cartItem {
  // ignore: prefer_typing_uninitialized_variables
  final productId;
  int quantity;
  // ignore: prefer_typing_uninitialized_variables
  final image;
  // ignore: prefer_typing_uninitialized_variables
  final price;
  // ignore: prefer_typing_uninitialized_variables
  final name;

  cartItem(
      {required this.name,
      required this.price,
      required this.productId,
      this.quantity = 1,
      required this.image});

  double get totalPrice => price * quantity;
}