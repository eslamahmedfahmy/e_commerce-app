import 'package:equatable/equatable.dart';
import 'package:shop_app/features/cart/domain/entites/cart_items.dart';


class Cart extends Equatable {
  final int subTotal;
  final int total;
  final List<CartItem> cartItems;


  const Cart({
    required this.subTotal,
    required this.total,
    required this.cartItems,

  });

  @override
  List<Object?> get props =>
      [
        subTotal,
        total,
        cartItems,
      ];
}