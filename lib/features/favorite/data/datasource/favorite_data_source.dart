import 'package:dio/dio.dart';
import 'package:shop_app/core/error/exception.dart';
import 'package:shop_app/core/network/api_constant.dart';
import 'package:shop_app/core/network/error_message_model.dart';
import 'package:shop_app/core/utils/dummy/constant.dart';
import 'package:shop_app/features/favorite/data/model/favorite_model.dart';

abstract class FavoriteBaseRemoteDataSource
{
  Future<List<GetFavoriteModel>> getFavoriteItem();

}

class FavoriteRemoteDataSource extends FavoriteBaseRemoteDataSource
{
  @override
  Future<List<GetFavoriteModel>> getFavoriteItem() async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          "Authorization":token,
        }
    )).get(ApiConstant.getFavorite);
    print(response);

    if(response.data['status'])
    {
      print('Get Favorite ********************************');
      return List<GetFavoriteModel>.from((response.data['data']['data']as List).map((e) => GetFavoriteModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}