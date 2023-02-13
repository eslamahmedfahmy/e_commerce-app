import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/exception.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/favorite/data/datasource/favorite_data_source.dart';
import 'package:shop_app/features/favorite/domain/baserepository/favorite_base_repository.dart';
import 'package:shop_app/features/favorite/domain/entites/favorite.dart';

class FavoriteRepository extends FavoriteBaseRepository
{
  final FavoriteBaseRemoteDataSource favoriteBaseRemoteDataSource;

  FavoriteRepository(this.favoriteBaseRemoteDataSource);

  @override
  Future<Either<Failure, List<Favorite>>> getFavorite() async
  {
    final result = await favoriteBaseRemoteDataSource.getFavoriteItem();

    try
    {
      print(result);
      return Right(result);
    }on ServerException catch(failure)
    {
      print('errrrrrrorrrrrrrrrrr');
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }


}