import 'package:dio/dio.dart';
import 'package:shop_app/core/error/exception.dart';
import 'package:shop_app/core/network/api_constant.dart';
import 'package:shop_app/core/network/error_message_model.dart';
import 'package:shop_app/core/utils/dummy/constant.dart';
import 'package:shop_app/features/cart/data/model/add_order_model.dart';
import 'package:shop_app/features/cart/data/model/cart_model.dart';
import 'package:shop_app/features/cart/data/model/update_cart_model.dart';
import 'package:shop_app/features/cart/domain/usescase/update_cart.dart';

abstract class CartBaseRemoteDataSource
{
  Future<GetCartModel> getCartItem();
  Future<AddOrderModel> addOrder();
  Future<UpdateCartModel> updateCart(UpdateCartParameters parameters);
}

class CartRemoteDataSource extends CartBaseRemoteDataSource
{
  @override
  Future<GetCartModel> getCartItem() async
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
    )).get(ApiConstant.getCart);
    print(response);

    if(response.data['status'])
    {
      print('Get Cart ********************************');
      return GetCartModel.fromJson(response.data['data']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<AddOrderModel> addOrder() async
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
    )).post(ApiConstant.addOrder , data:
    {
      'address_id': 35,
      'payment_method':1,
      'use_points':false,
    });
    print(response);

    if(response.data['status'])
    {
      print('Add Order ********************************');
      return AddOrderModel.fromJson(response.data['data']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<UpdateCartModel> updateCart(UpdateCartParameters parameters) async
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
    )).put(ApiConstant.updateCart(parameters.productId) , data:
    {
      'quantity': parameters.quantity,

    });
    print(response);

    if(response.data['status'])
    {
      print('Add Order ********************************');
      return UpdateCartModel.fromJson(response.data['data']['cart']);
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}