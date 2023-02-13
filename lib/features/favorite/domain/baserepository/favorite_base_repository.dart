import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/favorite/domain/entites/favorite.dart';

abstract class FavoriteBaseRepository
{
  Future<Either<Failure,List<Favorite>>> getFavorite();

}
