import 'package:dartz/dartz.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/favorite/domain/baserepository/favorite_base_repository.dart';
import 'package:shop_app/features/favorite/domain/entites/favorite.dart';

class GetFavoriteUseCase extends BaseUseCase<List<Favorite> , NoParameters>
{
  final FavoriteBaseRepository favoriteBaseRepository;

  GetFavoriteUseCase(this.favoriteBaseRepository);

  @override
  Future<Either<Failure, List<Favorite>>> call(NoParameters parameters) async
  {
    return await favoriteBaseRepository.getFavorite();
  }

}
