import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/cart/domain/entites/add_order.dart';
import 'package:shop_app/features/cart/domain/entites/cart.dart';
import 'package:shop_app/features/cart/domain/entites/update_cart.dart';
import 'package:shop_app/features/cart/domain/usescase/update_cart.dart';

abstract class CartBaseRepository
{
  Future<Either<Failure,Cart>> getCart();
  Future<Either<Failure , AddOrder>> addOrder();
  Future<Either<Failure , UpdateCart>> updateCart(UpdateCartParameters parameters);
}
